#! /do/not/run/representative/only

# tools for managing gcloud projects
# recall having to do something on the gcloud site first
# it may be that you can create it on the cl and then open it on console.cloud.google.com
mkdir mygclapp
cd mygclapp/
gcloud projects create llibrary
gcloud projects list
gcloud projects describe 838460373880
gcloud config list
gcloud config set project llibrary
gcloud projects delete llibrary
gcloud projects undelete llibrary

echo '(Select us west as region)'
gcloud app create

# create python virtual environment
mkdir python_env
cd python_env
python3 -m venv env
source env/bin/activate
deactivate
source env/bin/activate
cd ..

# finish 
cd project_files
pip install -r requirements.txt

# run locally
python main.py

# You have to enable cloud build API, which requires enabling billing.
# Maybe if you create the project on web console first this is already done.
# https://console.developers.google.com/apis/library/cloudbuild.googleapis.com?project=llibrary
gcloud app deploy
# takes a while the first time for a project / app
