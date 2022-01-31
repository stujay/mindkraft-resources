#!/usr/bin/env python3
import csv
import re
import sys

fields = ["thai", "phonetic", "register", "definition", "note"]

sections_re = re.compile(r"Super Useful.*\n+\(.*\n+", re.MULTILINE)
sectionsinc_re = re.compile(r"(Super Useful.*\n+\(.*\n+)", re.MULTILINE)
sentences_re = re.compile(r"^[0-9]+\)| [0-9]+\)", re.MULTILINE)

# Register notes, including but not limited to:
# INFORMAL, DRAMATIC, SEMI-FORMAL/LITERARY, VERY STRONG, SLANG, ANGRY
registers = r"[A-Z/]{2,}[ \-/]?[A-Z]+[ \-/]?[A-Z]+"
register_re = re.compile(r"%s or %s|%s" % (registers, registers, registers))

# a dash, but only if it's after whitespace
definition_seperator1_re = re.compile(r"\s—", re.MULTILINE)

# any combination of newlines and carriage returns
definition_seperator2_re = re.compile(r"[\r\n]+", re.MULTILINE)

# End only with a Thai character or )
thai_range = "\u0E00-\u0E7F"
end_thai_re = r"[%s)]" % thai_range
# Don't add Latin characters to this; there is no useful way to tell (Dave) from diacritic-free IPA
core_thai_re = r"[%s .…/ () 0-9]" % thai_range
thai_re = re.compile(r"%s+%s" % (core_thai_re, end_thai_re))  # Thai unicode block

# U+0300–U+036F = main IPA combining diacritics
# U+0250-U+02AF = IPA extension unicode block
# U+00DF-U+00FF = Latin1 extension block, accented lowercase characters, mainly
# U+0100-U+017F = Latin extended A, more accented Latin characters (uppercase and lowercase alternate)
# U+0180-U+0240 = Latin extended B, includes accented pinyin, some IPA symbols, etc...
phonetic_re = re.compile(
    r"[a-z \u0300-\u036f \u0250-\u02AF \u00DF-\u0240 ()-;-.…/\[\]]+"
)


def divide_into_sections(contents):
    section_headers = re.findall(sections_re, contents)
    sections = re.split(sections_re, contents)[1:]

    return list(zip(section_headers, sections))


def parse_thai_phonetic_register(text):
    register = ""
    maybe_register = re.search(register_re, text)
    if maybe_register:
        register = maybe_register.group(0)
    non_reg = re.sub(
        register_re, "", text, 1
    ).strip()  # Avoid any chance of matching the same text twice

    thai = re.search(thai_re, non_reg).group(0)
    rest = re.sub(thai_re, "", non_reg, 1).strip()

    phonetic = re.search(phonetic_re, rest).group(0)
    if phonetic[0] == "(" and phonetic[-1] == ")":
        phonetic = phonetic[1:-1]

    leftover = re.sub(phonetic_re, "", rest, 1).strip()

    return thai, phonetic, register, leftover


# thai (phonetic) — definition
# OR
# thai (phonetic)
# definition
# OR
# thai (phonetic) definition
def parse_main_sentence_a(sen):
    bulk, definition = None, None
    thai, phonetic, register = None, None, None
    leftover = ""
    if len(re.split(definition_seperator1_re, sen)) == 2:
        bulk, definition = re.split(definition_seperator1_re, sen)
        thai, phonetic, register, leftover = parse_thai_phonetic_register(bulk)
    elif len(re.split(definition_seperator2_re, sen)) >= 2:
        parts = re.split(definition_seperator2_re, sen)
        bulk = parts[0]
        definition = "/".join(parts[1:])
        thai, phonetic, register, leftover = parse_thai_phonetic_register(bulk)
    else:
        # It's all on one line with no explicit seperator
        # Consequently, no useful leftover check can be done
        thai, phonetic, register, definition = parse_thai_phonetic_register(sen)

    # Make sure nothing was skipped
    if leftover:
        print("oh dear, leftover! %s\n" % len(leftover), leftover)
        print("sen is", sen)
        print("thai", thai)
        print("phonetic", phonetic)
        print("register", register)
        print("definition", definition)
    assert leftover == ""

    return thai, phonetic, register, definition


def parse_sentence(sentence):
    print(sentence)
    sen = sentence
    note = ""
    if "Note:" in sentence:
        sen, note = sentence.split("Note:")
    thai, phonetic, register, definition = parse_main_sentence_a(sen.strip())
    return thai, phonetic, register, definition, note


def parse_section(section):
    header, content = section
    sentences = re.split(sentences_re, content)[1:]
    parsed = []
    for sentence in sentences:
        parsed.append(parse_sentence(sentence.strip()))
    return parsed


def parse(contents):
    sections = divide_into_sections(contents)
    parsed_sections = []

    for section in sections:
        parsed_section = parse_section(section)
        parsed_sections.append(parsed_section)

    return parsed_sections


def write_csv(parsed_section, filename):
    with open(filename, "w") as f:
        writer = csv.writer(f)
        writer.writerow(fields)
        writer.writerows(parsed_section)


def main(filename):
    contents = open(filename).read()
    parsed_sections = parse(contents)

    for i in range(len(parsed_sections)):
        outfile = "section-%s.csv" % str(i + 1).zfill(3)
        write_csv(parsed_sections[i], outfile)


if __name__ == "__main__":
    main("super.txt")
