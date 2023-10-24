
echo "Задание 1"
for i in {1..3}
do
    echo $USER
done

echo " "

echo "Задание 2"
n=0
while [ $n -le 100 ]
do
    echo $n
    let n+=2
done

echo " "

shopt -s expand_aliases
alias ll="ls -l"
ll | grep [-bcdDlps] | cut -c 1-10 | sort | uniq

echo " "

echo "Задание 4"
folder=$1
if [ -d "$folder" ]
then rm $folder/*.bak $folder/*.tmp $folder/*.backup 2>/dev/null
else echo "Ошибка. Нет такой директории:$folder"
fi
