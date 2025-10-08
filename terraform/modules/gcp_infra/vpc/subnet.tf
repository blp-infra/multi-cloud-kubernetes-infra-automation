resource "google_compute_subnetwork" "test_subnet" {
  depends_on = [ google_compute_network.my_test_vpc ]
  name          = "test-subnetwork"
  ip_cidr_range = var.cidr_block_gcp
  region        = var.region_gcp
  network       = google_compute_network.my_test_vpc.id

}

