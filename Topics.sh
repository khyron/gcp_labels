# List all topics in the project
topics=$(gcloud pubsub topics list --format="value(NAME)")

# Define your desired labels (key1=value1,key2=value2)
labels="key1=value1,key2=value2"

for topic in $topics; do
  # Update each topic with labels
  gcloud pubsub topics update $topic --update-labels=$labels
done

echo "Labels added to all Pub/Sub topics in the project."
