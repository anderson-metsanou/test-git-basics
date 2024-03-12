resource "google_compute_instance" "tf-instance-1" {
  name = "tf-instance-1-a"  
  machine_type = "e2-standard-2"
  boot_disk {
    initialize_params {
      image = "debian-11-bullseye-v20231010"
    }
  }
  network_interface {
    network = "tf-vpc-341038"
    subnetwork = "subnet-01"
    access_config {
      
    }
  }
  metadata_startup_script = <<-EOT
        #!/bin/bash
    EOT
    allow_stopping_for_update = true
}

resource "google_compute_instance" "tf-instance-2" {
  name = "tf-instance-2-a"  
  machine_type = "e2-standard-2"
  boot_disk {
    initialize_params {
      image = "debian-11-bullseye-v20231010"
    }
  }
  network_interface {
    network = "tf-vpc-341038"
    subnetwork = "subnet-02"
    access_config {
      
    }
  }
  metadata_startup_script = <<-EOT
        #!/bin/bash
    EOT
    allow_stopping_for_update = true
}


