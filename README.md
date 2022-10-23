# Aplikacja do przypominania o braniu leków

Aplikacja przypomina użytkownikowi o braniu danych leków w różnych porach, umożliwia dodawanie lub usuwanie leków.

## Widoki

Aplikacja będzie składać się z następujących widoków, dostępnych z poziomu menu:

- ekran główny
    Pokazuje następną porę zażycia leków oraz jakieś inne rzeczy.
- Lista leków
    Lista leków, można dodawać, usuwać, edytować leki.
    - Dodanie nowego leku
        Widget dodania nowej pozycji do listy będzie przenosić do ekranu dodania nowego leku, gdzie będzie można dodać
        następujące informacje:
        - nazwa leku
        - pory w których należy zażyć ten lek
        - lista leków której nie można brać razem z tym lekiem (opcjonalne)
        - notatki (opcjonalnie)
- Kalendarz
    Pokazuje kalendarz otwarty na aktualnym miesiącu, i dla każdego dnia wyświetla jakiś symbol jeżeli trzeba w tym dniu
    wziąć leki. Powinny być na tyle różne symbole lub kolory aby można było wizualnie odróżnić kiedy danego dnia
    użytkownik ma wziąć więcej/mniej leków lub inne leki. Po wybraniu dnia wyświetlić listę leków do wzięcia tego dnia
    zgrupowane do godziny.
- Strona "o aplikacji"
    Pokazuje podstawowe informacje o aplikacji, nazwa, logo, wersja, autorzy, licencje

## Powiadomienia

Aplikacja będzie w porach dnia wybranych przez użytkownika wysyłać powiadomienia o lekach do zażycia. Powiadomienia będą
przenosić do głównego widoku aplikacji, gdzie użytkownik będzie mógł potwierdzić zażycie leków.

## Modele danych:

- `Drug`
  - `name: String`
  - `dose: String`
  - `takeTimes: <DateTime>[]`
  - `incompatibleDrugs: <Drug>[]`
  - `notes: String`
