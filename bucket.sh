# Replace with your project ID and desired labels (key1=value1,key2=value2)
project_id="your-project-id"
labels="key1=value1,key2=value2"

# Get all buckets in the project
buckets=$(gcloud storage buckets list --project=$project_id --format="value(NAME)")

for bucket in $buckets; do
  # Update each bucket with labels
  gcloud storage buckets update $bucket --project=$project_id --labels=$labels
done

echo "Labels added to buckets in project: $project_id"
