locals {
  landing_zone_id_map = {
    local        = "local"
    core         = "core"
    connectivity = "cntx"
    management   = "mgmt"
    compute      = "cpt"
  }

  resource_scope_id_map = {
    sub = "s"
    env = "e"
  }

  environment_id_map = {
    default = "df"
    shared  = "sh"
    nonprod = "np"
    team    = "tm"
    dev     = "dv"
    prod    = "pd"
  }

  azure_region_id_map = {
    uksouth       = "uks"
    ukwest        = "ukw"
    westeurope    = "euw"
    northeurope   = "eun"
    eastus        = "use"
    eastus2       = "use2"
    westus        = "usw"
    westus2       = "usw2"
    centralus     = "usc"
    westcentralus = "uswc"

  }

  # https://learn.microsoft.com/en-us/azure/reliability/cross-region-replication-azure#azure-paired-regions
  azure_region_paired_map = {
    uksouth     = "ukwest"
    ukwest      = "uksouth"
    westeurope  = "northeurope"
    northeurope = "westeurope"
    eastus      = "westus"
    eastus2     = "centralus"
    westus2     = "westcentralus"
    westus3     = "eastus"
  }

  /*
    company_id
    landing zone
    resource_scope
    environment
    azure_region
    component
    resource_type
  */

  landing_zone_id        = local.landing_zone_id_map[var.landing_zone]
  resource_scope_id      = local.resource_scope_id_map[var.resource_scope]
  environment_id         = local.environment_id_map[var.environment]
  azure_region_id        = local.azure_region_id_map[var.azure_region]
  azure_paired_region    = local.azure_region_paired_map[var.azure_region]
  azure_paired_region_id = local.azure_region_id_map[local.azure_region_paired_map[var.azure_region]]

  resource_prefix       = "${var.company_id}-${var.landing_zone}-${var.resource_scope}-${var.environment}-${local.azure_region_id}-${var.component}"
  resource_prefix_short = "${var.company_id}${local.landing_zone_id}${local.resource_scope_id}${local.environment_id}${local.azure_region_id}${var.component_id}"

  resource_prefix_global = "${var.company_id}-${var.landing_zone}-${var.resource_scope}-${var.environment}-gbl-${var.component}"


  # // https://learn.microsoft.com/en-us/azure/cloud-adoption-framework/ready/azure-best-practices/resource-abbreviations //
  resource_names = {

    # // GENERAL //
    api_management           = "${local.resource_prefix}-apim"
    user_assigned_identities = "${local.resource_prefix}-id"
    management_group         = "${local.resource_prefix}-mg"
    resource_group           = "${local.resource_prefix}-rg"

    # // NETWORKING //
    application_gateway              = "${local.resource_prefix}-agw"
    application_security_group       = "${local.resource_prefix}-asg"
    bastion_host                     = "${local.resource_prefix}-bas"
    cdn_profile                      = "${local.resource_prefix}-cdnp"
    cdn_endpoint                     = "${local.resource_prefix}-cdne"
    connections                      = "${local.resource_prefix}-cxn"
    firewall                         = "${local.resource_prefix}-afw"
    firewall_network_rule_collection = "${local.resource_prefix}-afwr"
    firewall_policy                  = "${local.resource_prefix}-afwp"
    express_route_circuit            = "${local.resource_prefix}-erc"
    express_route_gateway            = "${local.resource_prefix}-ergw"
    frontdoor                        = "${local.resource_prefix_global}-afd"
    cdn_frontdoor_endpoint           = "${local.resource_prefix_global}-fde"
    frontdoor_firewall_policy        = "${local.resource_prefix}-fdfp"
    lb_internal                      = "${local.resource_prefix}-lbi"
    lb_external                      = "${local.resource_prefix}-lbe"
    lb_rule                          = "${local.resource_prefix}-rule"
    local_network_gateway            = "${local.resource_prefix}-lgw"
    nat_gateway                      = "${local.resource_prefix}-ngw"
    network_interface                = "${local.resource_prefix}-nic"
    network_security_group           = "${local.resource_prefix}-nsg"
    network_security_rule            = "${local.resource_prefix}-nsgsr"
    network_watcher                  = "${local.resource_prefix}-nw"
    private_link_service             = "${local.resource_prefix}-pl"
    private_endpoint                 = "${local.resource_prefix}-pep"
    public_ip                        = "${local.resource_prefix}-pip"
    public_ip_prefix                 = "${local.resource_prefix}-ippre"
    route_filter                     = "${local.resource_prefix}-rf"
    route_server                     = "${local.resource_prefix}-rtserv"
    route_table                      = "${local.resource_prefix}-rt"
    traffic_manager_profile          = "${local.resource_prefix}-traf"
    route                            = "${local.resource_prefix}-udr"
    virtual_network                  = "${local.resource_prefix}-vnet"
    subnet                           = "${local.resource_prefix}-snet"
    virtual_network_peering          = "${local.resource_prefix}-peer"
    virtual_wan                      = "${local.resource_prefix}-vwan"
    vpn_gateway                      = "${local.resource_prefix}-vpngw"
    vpn_gateway_connection           = "${local.resource_prefix}-vpncxn"
    vpn_site                         = "${local.resource_prefix}-vpnst"
    virtual_network_gateway          = "${local.resource_prefix}-vgw"
    web_application_firewall_policy  = "${local.resource_prefix}-wafp"

    # // COMPUTE and WEB //
    app_service_plan = "${local.resource_prefix}-asp"
    function_app     = "${local.resource_prefix}-func"

    # // CONTAINERS //
    kubernetes_cluster = "${local.resource_prefix}-aks"
    container_registry = "${local.resource_prefix_short}cr"
    container_group    = "${local.resource_prefix}ci"

    # // DATABASES //
    cosmosdb_account = "${local.resource_prefix}-cosmos"
    mssql_server     = "${local.resource_prefix}-sql"


    # // STORAGE //
    storage_account = "${local.resource_prefix_short}st"


    # // ANALYTICS and IOT //
    datalake_storage_account = "${local.resource_prefix_short}dls"
    data_factory             = "${local.resource_prefix}-adf"
    eventhub_namespace       = "${local.resource_prefix}-evhns"
    eventhub                 = "${local.resource_prefix}-evh"
    databricks_workspace     = "${local.resource_prefix}-dbw"
    synapse_workspace        = "${local.resource_prefix}-syn"


    # // INTEGRATION //
    logic_app_workflow   = "${local.resource_prefix}-logic"
    servicebus_namespace = "${local.resource_prefix}-sb"
    servicebus_queue     = "${local.resource_prefix}-sbq"
    servicebus_topic     = "${local.resource_prefix}-sbt"


    # // MANAGEMENT and GOVERNANCE //
    application_insights       = "${local.resource_prefix}-appi"
    automation_account         = "${local.resource_prefix}-aa"
    monitor_action_group       = "${local.resource_prefix}-ag"
    key_vault                  = "${local.resource_prefix_short}kv"
    purview_account            = "${local.resource_prefix}-pview"
    log_analytics_workspace    = "${local.resource_prefix}-log"
    monitor_diagnostic_setting = "${local.resource_prefix}-diag"
  }

  mandatory_resource_tags = {
    company        = var.company_id
    landing-zone   = var.landing_zone
    resource-scope = var.resource_scope
    environment    = var.environment
    component      = var.component
    repository     = var.repository
    pipeline       = var.pipeline
  }
}
