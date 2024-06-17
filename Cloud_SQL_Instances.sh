# Replace with your desired labels (key1=value1,key2=value2)
labels="key1=value1,key2=value2"

# List all Cloud SQL instances
instances=$(gcloud beta sql instances list --format="value(NAME)")

for instance in $instances; do
  # Update each instance with labels using beta command
  gcloud beta sql instances patch $instance --update-labels=$labels
done

echo "Labels added to all Cloud SQL instances in the project."
