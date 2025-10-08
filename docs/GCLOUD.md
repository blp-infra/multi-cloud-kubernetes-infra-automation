# Terrform credentials 

keep  service key in file
```export GOOGLE_APPLICATION_CREDENTIALS="/path/service_key.json"``` > ~/.bashrc

### authenticate the service service_key
```
gcloud auth activate-service-account --key-file=$GOOGLE_APPLICATION_CREDENTIALS

```

### Check

gcloud auth list