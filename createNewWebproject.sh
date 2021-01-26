#!/bin/bash

PROJECT_NAME="hello-world"

PROJECT_PARENT_FOLDER="$HOME/webproject"

RELACE_PROJECT=false

while [[ $# -gt 1 ]]
do
    key="$1"
    
    case $key in
        -f|--folder)
            PROJECT_PARENT_FOLDER="$2"
            shift # past argument
        ;;
        -n|--name)
            PROJECT_NAME="$2"
            shift # past argument
        ;;
        -r|--relace)
            RELACE_PROJECT="$2"
            shift # past argument
        ;;
        *)
            # unknown option
        ;;
    esac
    shift # past argument or value
done

PROJECT_FOLDER="$PROJECT_PARENT_FOLDER/$PROJECT_NAME"

if [ $RELACE_PROJECT ] && [ -d $PROJECT_FOLDER ]; then
    rm -fr $PROJECT_FOLDER
fi

if [ ! -d $PROJECT_FOLDER ]; then
    mkdir -p $PROJECT_FOLDER
else
    echo "$PROJECT_FOLDER already exist"
    exit 1
fi

git clone https://github.com/jarryDk/simple-webproject.git $PROJECT_FOLDER

rm -fr $PROJECT_FOLDER/.git

mv "$PROJECT_FOLDER/my-app" "$PROJECT_FOLDER/$PROJECT_NAME-webapp"