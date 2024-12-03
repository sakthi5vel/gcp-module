# Output the instance ID for further reference
output "instance_id" {
  value = google_compute_instance.vm.id
}

output "instance_private_ip" {
  value = google_compute_instance.vm.network_interface[0].network_ip
}



