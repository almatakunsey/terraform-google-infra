variable "org_id" {
  description = "Organisation name"
}

variable "project_id" {
  description = "GCP project ID"
}

variable "region" {
  description = "GCP project region"
}

variable "zone_default" {
  description = "GCP project zone default"
}

variable "env" {
  description = "Project environment"
}

variable "gke_services" {
  type = list(string)
  default = [
    "container.googleapis.com",
    "artifactregistry.googleapis.com",
    "cloudbuild.googleapis.com"
  ]
  description = "List of services to enable for GKE service"
}

variable "service_account_iam_roles" {
  type = list(string)
  default = [
    "roles/logging.logWriter",
    "roles/monitoring.metricWriter",
    "roles/monitoring.viewer",
    "roles/storage.objectViewer",
    "roles/stackdriver.resourceMetadata.writer",
    "roles/artifactregistry.reader"
  ]
  description = "List of IAM roles to assign to the service account."
}

#
# Networking
# ------------------------------

variable "vpc" {
  description = "Cluster VPC"
}

variable "cluster_core_cidr" {
  default = "10.1.0.0/16"
}

variable "authorized_source_ranges" {
  type        = list(string)
  default     = ["0.0.0.0/0"]
  description = "Addresses or CIDR blocks which are allowed to connect to GKE API Server."
}


#
# Kubernetes options
# ------------------------------

variable "k8s_instance_type" {
  default = "e2-standard-2"
}

variable "k8s_nodes_per_zone" {
  type        = number
  default     = 1
  description = "Number of nodes to deploy in each zone of the Kubernetes cluster. For example, if there are 4 zones in the region and num_nodes_per_zone is 2, 8 total nodes will be created."
}

variable "k8s_num_nodes" {
  default     = 2
  description = "number of gke nodes"
}

variable "k8s_username" {
  default     = "cluster-admin"
  description = "gke username"
}

variable "k8s_password" {
  default     = ""
  description = "gke password"
}


variable "k8s_master_ipv4_cidr" {
  type    = string
  default = "10.0.82.0/28"
}

variable "k8s_pod_ipv4_cidr" {
  default = "10.4.0.0/16"
}

variable "k8s_service_ipv4_cidr" {
  default = "10.8.0.0/16"
}


#
# KMS options
# ------------------------------
variable "k8s_secrets_crypto_key" {
  type        = string
  default     = "kubernetes-secrets"
  description = "Name of the KMS key to use for encrypting the Kubernetes database."
}

variable "kms_key_ring_common" {
  description = "Common key ring"
}