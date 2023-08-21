# lucky_generator

Lucky 4D Generator app: an app which generates 4d number based on analysis of past history. Still in developement for eventual launching once MVP is ready.

## Current Features
- querying data from Firebase RealtimeDB
- process and insert data to DriftDB
- calculate top 3 hot exact combinations, hot permutated combinations, hot doubles and hot triples, along with other relevant info such as occurrences, date of occurrence, etc
- analyse past results and attempt to generate a combination which is most likely to occur in the future draws.

## Core Frameworks:
- Firebase RealtimeDB
- DriftDB
- MobX Observers
- MVVM
- HTTP
- Localisation
- SharedPrefs
- ScreenUtils
