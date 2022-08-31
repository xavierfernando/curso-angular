#!/bin/bash
declare -i i=10
filename="r_palind_artesanal_primos.txt"
rm -f r_palind_artesanal2.txt
echo "Press CTRL+C to stop..."
sleep 1

while :; do
    if [[ $i -lt 999999999 ]]; then
        echo imprimindo numeral de 9 digitos das posicoes $(($i - 9)) a $(($i - 1)) da expansao decimal.
        deslocamento=$(expr $i - 9)
        #echo deslocamento = $deslocamento
        expansaoDecimal=$(echo $(pi $i) | cut -d'.' -f 2)
        #echo $expansaoDecimal
        expDecimalNoveDigitos=$(echo "${expansaoDecimal}" | cut -c "${deslocamento}"-)
        echo $expDecimalNoveDigitos

        for ((j = 8; j >= 0; j--)); do
            # echo entrou no laco do j
            revExpDecNoveDigitos="$revExpDecNoveDigitos${expDecimalNoveDigitos:$j:1}"
        done
        if [[ "$revExpDecNoveDigitos" == "$expDecimalNoveDigitos" ]]; then
            echo $expDecimalNoveDigitos e $revExpDecNoveDigitos sao palindromos
            echo posicoes $(($i - 9)) a $(($i - 1)) da expansao decimal $expDecimalNoveDigitos >>r_palind_artesanal2.txt
            # read -p "press Enter to continue... "
            sleep 5
            while IFS= read -r line; do
                if [ $line -eq $expDecimalNoveDigitos ]; then
                    echo $line foi encontrado no arquivo.
                    echo "${line} eh o primeiro palindromo primo de 9 digitos da expansao decimal de PI" | tee -a r_palind_artesanal2.txt
                    exit
                fi
            done <"$filename"
            echo "${expDecimalNoveDigitos} eh palindromo porem nao primo de 9 digitos da expansao decimal de PI" | tee -a r_palind_artesanal2.txt
        fi
        revExpDecNoveDigitos=""
        ((i++))
        echo
        echo
    else
        break
    fi
done
