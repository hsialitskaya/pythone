read -p "Wybierz opcję (a-k): " option1

case $option1 in
    a)	 
        echo "Aktualna data i godzina: $(date)"
    ;;
    b)	
        ls 
    ;;
    c)	
        echo "Nazwa użytkownika: $USER"
    ;;
    d)	
        read -p "Podaj nazwę katalogu: " argument
        mkdir "$argument"
        echo "Utworzono katalog \"$argument\"."
    ;;
    e)	
        read -p "Podaj nazwę pliku do usunięcia: " file_to_remove
        rm "$file_to_remove"
        echo "Usunięto plik \"$file_to_remove\"."
    ;;
    f)	
        read -p "Podaj nazwę pliku: " file_to_display
        head -n 10 "$file_to_display"
    ;;
    g)	
        read -p "Podaj nazwę pliku: " file_to_display
        tail -n 10 "$file_to_display"
    ;;
    i)	
        number_of_files=$(ls -l . | grep -c "^-")
        echo "Liczba plików w bieżącym katalogu: $number_of_files"
    ;;
    j)	
        echo "Pliki .txt w katalogu: $(ls *.txt)"
    ;;
    k)
        while true; do
            clear
            echo "Menu:"
            echo "1. Obliczenie sumy liczb od 1 do N (użytkownik podaje N)."
            echo "2. Odczytanie i wyświetlenie zawartości pliku w odwrotnej kolejności (użytkownik podaje nazwę pliku)."
            echo "3. Sprawdzenie, czy podana ścieżka jest katalogiem czy plikiem."
            echo "4. Zliczenie liczby plików i katalogów w bieżącym katalogu."
            echo "5. Wyszukanie plików o podanej nazwie w bieżącym katalogu."
            read -p "Wybierz opcję (1-5, q aby wrócić do poprzedniego menu): " option2

            case $option2 in
                1)
                    read -p "Podaj liczbę N: " a
                    wynik=0
                    for ((i=1; i<=a; i++)); do
                        ((wynik += i))
                    done
                    echo "$wynik"
                    ;;
                2)
                    read -p "Podaj nazwę pliku: " file_to_reverse
                    reversed_content=""
                    while IFS= read -r line; do
                        reversed_content="$line $reversed_content"
                    done < "$file_to_reverse"
                    echo "$reversed_content"
                    ;;
                3)
                    read -p "Podaj nazwę pliku lub katalogu: " file_katalog
                    if [ -f "$file_katalog" ]; then
                        echo "To jest plik."
                    elif [ -d "$file_katalog" ]; then
                        echo "To jest katalog."
                    else
                        echo "Podana ścieżka nie istnieje lub jest czymś innym."
                    fi
                    ;;
                4)
                    number_of_items=$(ls -l | grep -c "^")
                    echo "Liczba plików i katalogów w bieżącym katalogu: $number_of_items"
                    ;;
                5)
                    read -p "Podaj nazwę pliku do wyszukania: " file_to_find
                    grep -f "$file_to_find" *
                    ;;
                q)
                    break
                    ;;
                *)
                    echo "Nieprawidłowa opcja. Spróbuj ponownie."
                    ;;
            esac

            read -p "Naciśnij Enter, aby kontynuować..."
        done
    ;;
esac
