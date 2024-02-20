#!/usr/bin/env python3
import pytz
from thefuzz import process
from datetime import datetime, timedelta
from prettytable import PrettyTable

def get_closest_timezone(input_city):
    """ Find the closest matching time zone for the input city. """
    all_timezones = pytz.all_timezones
    closest_match = process.extractOne(input_city, all_timezones)
    return closest_match[0] if closest_match else None

def color_time(hour):
    """ Return terminal color code based on the hour. """
    if 9 <= hour <= 17:
        return '\033[92m'  # Green
    elif 7 <= hour < 9 or 17 < hour <= 18:
        return '\033[93m'  # Orange
    else:
        return '\033[0m'   # Default

def main():
    cities = []
    while len(cities) < 10:
        input_city = input(f"Enter city {len(cities)+1} (or leave blank to finish): ").strip()
        if input_city:
            timezone_name = get_closest_timezone(input_city)
            if timezone_name:
                print(f"Did you mean '{timezone_name}'? [Y/n]: ", end='')
                confirmation = input().strip().lower()
                if confirmation in ['y', 'yes', '']:
                    cities.append((timezone_name, pytz.timezone(timezone_name)))
                else:
                    print("Please try entering the city name again.")
            else:
                print("No matching timezone found. Please try again.")
        elif cities:
            break
        else:
            print("At least one city is required.")
            continue

    if cities:
        table = PrettyTable()
        table.field_names = [city for city, _ in cities]

        base_city_timezone = cities[0][1]
        base_time = datetime.now(base_city_timezone).replace(hour=0, minute=0, second=0, microsecond=0)
        for hour in range(24):
            row_time = base_time + timedelta(hours=hour)
            row = []
            for city, tz in cities:
                local_time = row_time.astimezone(tz)
                formatted_time = local_time.strftime('%H:%M')
                color = color_time(local_time.hour)
                row.append(color + formatted_time + '\033[0m')
            table.add_row(row)

        print(table)

if __name__ == "__main__":
    main()
