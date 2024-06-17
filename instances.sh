# List all instances in the current zone (replace if needed)
instances=$(gcloud compute instances list --format="value(NAME)" --zone "us-central1-a")

# Define your desired labels (key1=value1,key2=value2)
labels="key1=value1,key2=value2"

for instance in $instances; do
  # Update each instance with labels
  gcloud compute instances add-labels $instance --labels=$labels
done

echo "Labels added to all instances in zone us-central1-a"
