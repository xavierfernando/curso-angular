#!/bin/bash
declare -i i=149990

echo "Press CTRL+C to stop..."
sleep 1

while :
do 
  if [[ $i -lt 999999999 ]]
  then
    echo imprimindo numeral de 9 digitos das posicoes $(($i-9)) a $(($i-1)) da expansao decimal. 
    deslocamento=$(expr $i - 9)
    #echo deslocamento = $deslocamento
    expansaoDecimal=$(echo $(pi $i) | cut -d'.' -f 2)
    #echo $expansaoDecimal
    expDecimalNoveDigitos=$(echo "${expansaoDecimal}" | cut -c "${deslocamento}"-)
    echo $expDecimalNoveDigitos 

    for (( j=8; j >= 0; j-- ));
    do 
      revExpDecNoveDigitos="$revExpDecNoveDigitos${expDecimalNoveDigitos:$j:1}"
    done
    if [[ "$revExpDecNoveDigitos" == "$expDecimalNoveDigitos" ]]; then
      sleep 1
      echo $expDecimalNoveDigitos e $revExpDecNoveDigitos sao palindromos
        for(( k=2; k<=expDecimalNoveDigitos/2; k++ ))
        do
        echo k = $k
        ehprimo=true
        if [ $((expDecimalNoveDigitos%k)) -eq 0 ]
        then
            echo "$expDecimalNoveDigitos is not a prime."
            echo dividido por $k nao teve resto divisao 
            sleep 10
            ehprimo=false
            k=$expDecimalNoveDigitos
        else
            echo dividido por $k teve resto divisao  
            sleep 5
        fi
        done
    else
      if [[ $ehprimo = true ]]
      then
        break
      fi 
      revExpDecNoveDigitos=""
    fi
    ((i++))
    echo 
    echo
  else
    break
  fi
done