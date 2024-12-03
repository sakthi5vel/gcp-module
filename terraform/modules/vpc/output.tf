output "vpc_network_id" {
  value = google_compute_network.vpc.id
}

output "subnet_ids" {
  value = google_compute_subnetwork.subnet[*].id
}