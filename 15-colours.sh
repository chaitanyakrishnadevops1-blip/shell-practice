#!/bin/bash

USERID=$(id -u)

R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"


if [ $USERID -ne 0 ]; then
      echo "ERROR:: please run this script with root privelege"
      exit 1 # failure is other than 0

fi

 VALIDATE(){
     if [ $1 -ne 0 ]; then
    echo -e "Installing $2....$R is failure $N"
    exit 1
else
     echo  -e "Installing $2 ...$G is SUCCESS $N"
  fi

}

dnf list installed mysql
# Install if it is not found
if [ $? -ne 0 ]; then
dnf install mysql-server -y
VALIDATE $? "MYSQL"

 else
 echo -e "MYSQL already exist ...$Y SKIPPING $N"

  fi

dnf list installed nginx
if [ $? -ne 0 ]; then
dnf install nginx -y
VALIDATE $? "Nginx"
 else
   echo  -e "Nginx already exist ...$Y is SUCCESS $N"
fi

 dnf list installed python3
  if [ $? -ne 0 ]; then
   dnf install python-3 -y
    VALIDATE $? "python3"
     else
   echo  -e "python3 already exist ...$Y is SUCCESS $N"

   fi