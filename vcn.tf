resource "oci_core_vcn" "my_vcn" {
  cidr_block     = "10.0.0.0/16"
  compartment_id = "YOUR_COMPARTMENT_OCID"
  display_name   = "my-vcn"
}

resource "oci_core_subnet" "public_subnet" {
  count           = 1
  cidr_block      = "10.0.1.0/24"
  compartment_id  = oci_core_vcn.my_vcn.compartment_id
  vcn_id          = oci_core_vcn.my_vcn.id
  display_name    = "public-subnet"
  availability_domain = "YOUR_AD"
  route_table_id  = oci_core_vcn.my_vcn.default_route_table_id
  security_list_ids = [oci_core_vcn.my_vcn.default_security_list_id]
}

resource "oci_core_subnet" "private_subnet" {
  count           = 1
  cidr_block      = "10.0.2.0/24"
  compartment_id  = oci_core_vcn.my_vcn.compartment_id
  vcn_id          = oci_core_vcn.my_vcn.id
  display_name    = "private-subnet"
  availability_domain = "YOUR_AD"
  route_table_id  = oci_core_vcn.my_vcn.default_route_table_id
  security_list_ids = [oci_core_vcn.my_vcn.default_security_list_id]
}
