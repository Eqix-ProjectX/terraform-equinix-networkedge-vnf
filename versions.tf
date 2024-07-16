terraform {
  required_providers {
    equinix = {
      source = "equinix/equinix"
      version = "~> 1.35.0"
    }
    iosxe   = {
      source = "CiscoDevNet/iosxe"
      version = "0.5.6"
    }
  }
}
