let baseAbugida = {
  categories: [
    {
      categoryName: "main-consonants",
      label: "Main Consonants",
      columns: [
        {
          index: 0,
          name: "stopped-throat",
          label: "Stopped Throat",
          glyph: "q",
          vargas: [
            {
              index: 0,
              label: "Gutteral",
              consonants: [
                {
                  consonant: "क",
                  ipa: "k",
                  transliteration: "k",
                  glyph: "aq",
                  class: "gutteral-stopped",
                },
              ],
            },
            {
              index: 1,
              label: "Palatal",
              consonants: [
                {
                  consonant: "च",
                  ipa: "c",
                  transliteration: "c",
                  glyph: "sq",
                  class: "palatal-stopped",
                },
              ],
            },
            {
              index: 2,
              label: "Cerebral",
              consonants: [
                {
                  consonant: "ट",
                  ipa: "ʈ",
                  transliteration: "ṭ",
                  glyph: "dq",
                  class: "cerebral-stopped",
                },
              ],
            },
            {
              index: 3,
              label: "Dental",
              consonants: [
                {
                  consonant: "त",
                  ipa: "t",
                  transliteration: "t",
                  glyph: "fq",
                  class: "dental-stopped",
                },
              ],
            },
            {
              index: 4,
              label: "Labial",
              consonants: [
                {
                  consonant: "प",
                  ipa: "p",
                  transliteration: "p",
                  glyph: "gq",
                  class: "labial-stopped",
                },
              ],
            },
          ],
        },
        {
          index: 1,
          name: "aspirated",
          label: "Aspirated",
          glyph: "w",
          vargas: [
            {
              index: 0,
              label: "Gutteral",
              consonants: [
                {
                  consonant: "ख",
                  ipa: "kʰ",
                  transliteration: "kh",
                  glyph: "aw",
                  class: "gutteral-aspirated",
                },
              ],
            },
            {
              index: 1,
              label: "Palatal",
              consonants: [
                {
                  consonant: "च",
                  ipa: "c",
                  transliteration: "c",
                  glyph: "sq",
                  class: "palatal-stopped",
                },
              ],
            },
            {
              index: 2,
              label: "Cerebral",
              consonants: [
                {
                  consonant: "ट",
                  ipa: "ʈ",
                  transliteration: "ṭ",
                  glyph: "dq",
                  class: "cerebral-stopped",
                },
              ],
            },
            {
              index: 3,
              label: "Dental",
              consonants: [
                {
                  consonant: "त",
                  ipa: "t",
                  transliteration: "t",
                  glyph: "fq",
                  class: "dental-stopped",
                },
              ],
            },
            {
              index: 4,
              label: "Labial",
              consonants: [
                {
                  consonant: "प",
                  ipa: "p",
                  transliteration: "p",
                  glyph: "gq",
                  class: "labial-stopped",
                },
              ],
            },
          ],
        },
        {
          index: 2,
          name: "voiced",
          label: "Voiced",
          glyph: "e",
        },
        {
          index: 3,
          name: "voiced-aspirated",
          label: "Voiced Aspirated",
          glyph: "E",
        },
        {
          index: 4,
          name: "nasal",
          label: "Nasal",
          glyph: "r",
        },
      ],
    },
    {
      categoryName: "semi-vowels",
      label: "Semi Vowels",
      columns: [
        {
          index: 0,
          name: "semi-vowels",
          label: "Semi Vowels",
          glyph: "t",
        },
      ],
    },
    {
      categoryName: "sibilants",
      label: "Sibilants",
      columns: [
        {
          index: 0,
          name: "sibilants",
          label: "Sibilants",
          glyph: "y",
        },
      ],
    },
    {
      categoryName: "base-aspirant",
      label: "Base Aspirant",
      columns: [
        {
          index: 0,
          name: "base-aspirant",
          label: "Base Aspirant",
          glyph: "W",
        },
      ],
    },
    {
      categoryName: "throat-base",
      label: "Throat Base",
      columns: [
        {
          index: 0,
          name: "throat-base",
          label: "Throat Base",
          glyph: "Q",
        },
      ],
    },
    {
      categoryName: "miscellaneous",
      label: "Miscellaneous",
      columns: [
        {
          index: 0,
          name: "miscellaneous",
          label: "Miscellaneous",
          glyph: ".",
        },
      ],
    },
  ],
  rows: [
    {
      name: "",
      label: "",
      glyph: "",
    },
    {
      name: "gutteral",
      label: "Gutteral",
      glyph: "a",
    },
    {
      name: "palatal",
      label: "Palatal",
      glyph: "s",
    },

    {
      name: "cerebral",
      label: "Cerebral",
      glyph: "d",
    },
    {
      name: "dental",
      label: "Dental",
      glyph: "f",
    },
    {
      name: "labial",
      label: "Labial",
      glyph: "g",
    },
  ],
};

export default baseAbugida;
