# external-dns service account
resource "google_service_account" "external-dns" {
    account_id = "external-dns"
    display_name = "external-dns service account"
}

# allow external-dns service account to be an admin for dns records in Cloud DNS
resource "google_project_iam_member" "external_dns_member" {
    for_each = toset([
        "roles/dns.admin",
    ])
    
    project = var.project_name
    role = each.key
    member = "serviceAccount:${google_service_account.external-dns.email}"
}

# give the Kubernetes Service Account (hardcoded to external-dns in the external-dns namespace) to impersonate a Google Service Account
resource "google_project_iam_binding" "external-dns-binding" {
    project = var.project_name
    role = "roles/iam.workloadIdentityUser"
    members = [
        "serviceAccount:${var.project_name}.svc.id.goog[external-dns/external-dns]",
    ]
}

# packer service account
resource "google_service_account" "packer" {
    account_id = "packer"
    display_name = "packer service account"
}

resource "google_project_iam_member" "packer_member" {
    for_each = toset([
        "roles/iam.serviceAccountUser", #Service Account User
        "roles/compute.instanceAdmin.v1" #Compute Instance Admin v1
    ])

    project = var.project_name
    role = each.key
    member = "serviceAccount:${google_service_account.packer.email}"
}