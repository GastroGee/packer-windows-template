packer {
  required_version = ">= 1.8.6"
  required_plugins {
    git = {
      version = ">= 0.3.3"
      source  = "github.com/ethanmdavidson/git"
    }
    vsphere = {
      version = ">= v1.1.1"
      source  = "github.com/hashicorp/vsphere"
    }
    windows-update = {
      version = ">= 0.14.1"
      source  = "github.com/rgl/windows-update"
    }
    ansible = {
      version = ">= 1.0.2"
      source = "github.com/hashicorp/ansible"
    }
  }
}

// Variable 
// vSphere Connection Settings 
variable "vcenter_server" {
    type = string
    description = "The fully qualified domain name or IP address of the vCenter Server instance. (e.g. 'esx.gastro.io')"
}

variable "vcenter_username" {
    type = string
    description = "The username to login to the vCenter Server instance. (e.g. 'svc-packer-vsphere@gastro.io')"
}

variable "vcenter_password" {
    type = string
    description = "The password for the login to the vCenter Server instance."
}

variable "vsphere_insecure_connection" {
    type = bool
    default = true
    description = "Do not validate vCenter Server TLS certificate."
}


// vSphere Settings

variable "vsphere_cluster" {
    type = string
    description = "The name of the target vSphere cluster. (e.g. 'UCS')"
}

variable "vsphere_datastore" {
    type = string
    description = "The name of the target vSphere datastore."
}

variable "vsphere_folder" {
    type = string
    description = "The name of the target vSphere folder."
}

variable "resource_pool" {
    type = string
    description = "The name of the target vSphere resource pool."
}

variable "vsphere_network" {
    type = string
    description = "The name of the target vSphere network."
}

// Installer Settings 

variable "vm_inst_os_language" {
    type = string
    description = "The installation operating system lanugage."
    default = "en-US"
}

variable "vm_inst_os_keyboard" {
    type = string
    description = "The installation operating system keyboard input."
    default = "en-US"
}

variable "vm_inst_os_image_standard_desktop" {
    type = string
    description = "The installation operating system image input for Microsoft Windows Standard Desktop."
    default = "Windows Server 2019 SERVERSTANDARD"
}

variable "vm_inst_os_kms_key_standard" {
    type = string
    description = "The installation operating system KMS key input for Microsoft Windows Standard Edition."
    default = "N69G4-B89J2-4G8F4-WWYCC-J464C"
}

// Virtual Machine Settings 
variable "vm_guest_os_language" {
    type = string
    description = "The guest operating system lanugage."
    default = "en-US"
}

variable "vm_guest_os_keyboard" {
    type = string
    description = "The guest operating system keyboard input."
    default = "en-US"
}

variable "vm_guest_os_timezone" {
    type = string
    description = "The guest operating system timezone."
    default = "UTC"
}

variable "vm_guest_os_family" {
    type = string
    description = "The guest operating system family. Used for naming and VMware tools. (e.g.'windows')"
    default = "windows"
}

variable "vm_guest_os_name" {
    type = string
    description = "The guest operating system name. Used for naming. (e.g. 'server')"
    default = "server"
}

variable "vm_guest_os_version" {
    type = string
    description = "The guest operating system version. Used for naming. (e.g. '2019')"
    default = "2019"
}

variable "vm_guest_os_edition_standard" {
    type = string
    description = "The guest operating system edition. Used for naming. (e.g. 'datacenter')"
    default = "standard"
}

variable "vm_guest_os_experience_desktop" {
    type = string
    description = "The guest operating system minimal experience. Used for naming. (e.g. 'core')"
    default = "dexp"
}

variable "vm_guest_os_type" {
    type = string
    description = "The guest operating system type, also know as guestid. (e.g. 'windows2019srv_64Guest')"
    default = "windows2019srv_64Guest"
}

variable "vm_firmware" {
    type = string
    description = "The virtual machine firmware. (e.g. 'efi-secure'. 'efi', or 'bios')"
    default = "efi-secure"
}

variable "vm_cdrom_type" {
    type = string
    description = "The virtual machine CD-ROM type. (e.g. 'sata', or 'ide')"
    default = "sata"
}

variable "vm_cpu_count" {
    type = number
    description = "The number of virtual CPUs. (e.g. '4')"
    default = 4
}

variable "vm_cpu_cores" {
    type = number
    description = "The number of virtual CPUs cores per socket. (e.g. '1')"
    default = 2
}

variable "vm_cpu_hot_add" {
    type = bool
    description = "Enable hot add CPU."
    default = true
}

variable "vm_mem_size" {
    type = number
    description = "The size for the virtual memory in MB. (e.g. '2048')"
    default = 4096
}

variable "vm_mem_hot_add" {
    type = bool
    description = "Enable hot add memory."
    default = true
}

variable "vm_disk_size" {
    type = number
    description = "The size for the virtual disk in MB. (e.g. '100000')"
    default = 200000
}

variable "vm_disk_controller_type" {
    type = list(string)
    description = "The virtual disk controller types in sequence. (e.g. 'pvscsi')"
    default = ["lsilogic-sas"]
}

variable "vm_disk_thin_provisioned" {
    type = bool
    description = "Thin provision the virtual disk."
    default = true
}

variable "vm_network_card" {
    type = string
    description = "The virtual network card type. (e.g. 'vmxnet3' or 'e1000e')"
    default = "vmxnet3"
}

variable "common_remove_cdrom" {
    type = bool
    description = "Remove the virtual CD-ROM(s)."
    default = true
}

variable "vm_boot_wait" {
    type = string
    description = "The time to wait before boot."
    default = "2s"
}

variable "vm_boot_command" {
    type    = list(string)
    description = "The virtual machine boot command."
    default = ["<spacebar>"]
}
variable "vm_boot_order" {
    type = string
    description = "The boot order for virtual machines devices. (e.g. 'disk,cdrom')"
    default = "disk,cdrom"
}

variable "vm_shutdown_command" {
    type = string
    description = "Command(s) for guest operating system shutdown."
    default = "shutdown /s /t 10 /f /d p:4:1 /c \"Shutdown by Packer\""
}

// Template and Content Library Settings

variable "common_template_conversion" {
    type = bool
    description = "Convert the virtual machine to template. Must be 'false' for content library."
    default = false
}

variable "common_content_library_name" {
    type = string
    description = "The name of the target vSphere content library, if used. (e.g. 'sfo-w01-cl01-lib01')"
    default = null
}

variable "common_content_library_ovf" {
    type = bool
    description = "Export to content library as an OVF template."
    default = true
}

variable "common_content_library_destroy" {
    type = bool
    description = "Delete the virtual machine after exporting to the content library."
    default = true
}

variable "common_content_library_skip_export" {
    type = bool
    description = "Skip exporting the virtual machine to the content library. Option allows for testing / debugging without saving the machine image."
    default = false
}

// OVF Export Settings

variable "common_ovf_export_enabled" {
    type = bool
    description = "Enable OVF artifact export."
    default = false
}

variable "common_ovf_export_overwrite" {
    type = bool
    description = "Overwrite existing OVF artifact."
    default = true
}

// Removable Media Settings

variable "common_iso_datastore" {
    type = string
    description = "The name of the source vSphere datastore for ISO images. (e.g. 'IMAGES')"
}

variable "iso_path" {
    type = string
    description = "The path on the source vSphere datastore for ISO image. (e.g. 'ISO/windows')"
}

variable "iso_file" {
    type = string
    description = "The file name of the ISO image used by the vendor. (e.g. '<language>_windows_server_<version>_updated_<month_year>_x64_dvd_<string>.iso')"
    default = "SW_DVD9_WIN_SERVER_STD_CORE_2019_1809.19_64BIT_ENGLISH_DC_STD_MLF_X23-31944.ISO"
}

variable "iso_checksum_type" {
    type = string
    description = "The checksum algorithm used by the vendor. (e.g. 'sha256')"
    default = "sha256"
}

variable "iso_checksum_value" {
    type = string
    description = "The checksum value provided by the vendor."
    default = "22AA0271BDBF9F41283D5960B10506D015C9DE6DBFF5E3430CEA2A22C687576F"
}


// Communicator Settings and Credentials 

variable "winrm_username" {
    type = string
    description = "The username to login to the guest operating system. (i.e. 'windows target')"
}

variable "winrm_password" {
    type = string
    description = "The username to login to the guest operating system. (i.e. 'windows target')"
}

// Communicator Credentials

variable "communicator_port" {
    type = string
    description = "The port for the communicator protocol."
    default = "5985"
}

variable "communicator_timeout" {
    type = string
    description = "The timeout for the communicator protocol."
    default = "12h"
}

// Provisioner Settings
variable "scripts" {
    type = list(string)
    description = "A list of scripts and their relative paths to transfer and run."
    default = ["scripts/windows-init.ps1", "scripts/windows-prepare.ps1", "scripts/windows-vmtools.ps1"]
}

variable "inline" {
    type = list(string)
    description = "A list of commands to run."
    default = []
}


//  Defines the data sources.
data "git-repository" "cwd" {}

//  Local Variables.
locals {
    build_by = "Built by: HashiCorp Packer ${packer.version}"
    build_date = formatdate("YYYY-MM-DD hh:mm ZZZ", timestamp())
    build_version = data.git-repository.cwd.head
    build_description = "Version: ${local.build_version}\nBuilt on: ${local.build_date}\n${local.build_by}"
    iso_paths = ["[${var.common_iso_datastore}] ${var.iso_path}/${var.iso_file}", "[${var.common_iso_datastore}] VMware/vmtools/windows.iso"]
    iso_checksum = "${var.iso_checksum_type}:${var.iso_checksum_value}"
    manifest_date = formatdate("YYYY-MM-DD hh:mm:ss", timestamp())
    ovf_export_path = "${path.cwd}/artifacts/"
    vm_name = "${var.vm_guest_os_family}-${var.vm_guest_os_name}-${var.vm_guest_os_version}-${var.vm_guest_os_edition_standard}-${local.build_version}"
}

source "vsphere-iso" "windows" {
    // vcenter server settings 
    vcenter_server  = var.vcenter_server
    username        = var.vcenter_username
    password        = var.vcenter_password
    insecure_connection = var.vsphere_insecure_connection
    // vsphere settings 
    resource_pool   = var.resource_pool
    cluster         = var.vsphere_cluster
    datastore       = var.vsphere_datastore
    folder          = var.vsphere_folder
    // Virtual Machine Settings 
    vm_name = local.vm_name
    guest_os_type = var.vm_guest_os_type
    firmware = var.vm_firmware
    CPUs = var.vm_cpu_count
    cpu_cores = var.vm_cpu_cores
    CPU_hot_plug = var.vm_cpu_hot_add
    RAM = var.vm_mem_size
    RAM_hot_plug = var.vm_mem_hot_add
    cdrom_type = var.vm_cdrom_type
    disk_controller_type = var.vm_disk_controller_type
    storage {
        disk_size = var.vm_disk_size
        disk_thin_provisioned = var.vm_disk_thin_provisioned
    }
    network_adapters {
        network = var.vsphere_network
        network_card = var.vm_network_card
    }
    remove_cdrom = var.common_remove_cdrom
    notes = local.build_description
    // Removable Media Settings
    iso_paths = local.iso_paths
    iso_checksum = local.iso_checksum
    cd_files = [
        "${path.cwd}/scripts/"
        ]
    cd_content = {
        "autounattend.xml" = templatefile("${abspath(path.root)}/data/autounattend.pkrtpl.hcl", {
            winrm_username = var.winrm_username
            winrm_password = var.winrm_password
            vm_inst_os_language = var.vm_inst_os_language
            vm_inst_os_keyboard = var.vm_inst_os_keyboard
            vm_inst_os_image = var.vm_inst_os_image_standard_desktop
            vm_inst_os_kms_key = var.vm_inst_os_kms_key_standard
            vm_guest_os_language = var.vm_guest_os_language
            vm_guest_os_keyboard = var.vm_guest_os_keyboard
            vm_guest_os_timezone = var.vm_guest_os_timezone
            })
        }
    // Boot and Provisioning Settings
    boot_order = var.vm_boot_order
    boot_wait = var.vm_boot_wait
    boot_command = var.vm_boot_command
    shutdown_command = var.vm_shutdown_command
    // Communicator Settings and Credentials
    communicator = "winrm"
    winrm_username = var.winrm_username
    winrm_password = var.winrm_password
    winrm_port = var.communicator_port
    winrm_timeout = var.communicator_timeout
    // Template and Content Library Settings
    convert_to_template = var.common_template_conversion
    dynamic "content_library_destination" {
        for_each = var.common_content_library_name != null ? [1] : []
            content {
                library = var.common_content_library_name
                description = local.build_description
                ovf = var.common_content_library_ovf
                destroy = var.common_content_library_destroy
                skip_import = var.common_content_library_skip_export
            }
        }
}

// build block 

build {
    sources = ["source.vsphere-iso.windows"]

    provisioner "powershell" {
        environment_vars = [
            "WINRM_USERNAME=${var.username}"
        ]
        elevated_user = var.winrm_username
        elevated_password = var.winrm_password
        scripts = ["scripts/windows-init.ps1", "scripts/windows-prepare.ps1", "scripts/windows-vmtools.ps1"]
    }

    provisioner "powershell" {
        elevated_username = var.winrm_username
        elevated_password = var.winrm_password
        inline = [
            "Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))",
            "choco feature enable -n allowGlobalConfirmation",
            "Get-EventLog -LogName * | ForEach { Clear-EventLog -LogName $_.Log }",
            "choco install visualstudio2019community --version=16.11.3.0",
            "choco install visualstudio2022community --version=117.5.3.0",
            "choco install visualstudio2019buildtools --version=16.11.3.0",
            "choco install visualstudio2022buildtools --version=117.5.3.0"
        ]
    }


// Sample Block for Ansible Provisioner
//   provisioner "ansible" {
//     ansible_env_vars = ["ANSIBLE_ROLES_PATH=ansible/roles", "ANSIBLE_FORCE_COLOR=True"]
//     extra_arguments = [
//       "--extra-vars", "\"ansible_user=${var.winrm_username}\"",
//       "--extra-vars", "\"ansible_password=${var.winrm_password}\"",
//       "--extra-vars", "\"vcenter_username=${var.vcenter_username}\"",
//       "--extra-vars", "\"vcenter_password=${var.vcenter_password}\"",
//       "--extra-vars", "ansible_shell_type=powershell",
//       "--extra-vars", "ansible_shell_executable=None",
//       "--extra-vars", "ansible_connection=winrm",
//       "--extra-vars", "ansible_winrm_transport=basic",
//       "--extra-vars", "\"ansible_port=${var.communicator_port}\"",
//       "--extra-vars", "ansible_winrm_server_cert_validation=ignore"
//     ]
//     playbook_file = "ansible/playbooks/windows.yml"
//     user = var.winrm_username
//     use_proxy = false
//   }


    provisioner "ansible" {
        ansible_env_vars = ["ANSIBLE_ROLES_PATH=ansible/roles", "ANSIBLE_FORCE_COLOR=True"]
        extra_arguments = [
            "--extra-vars", "\"ansible_user=${var.winrm_username}\"",
             "--extra-vars", "\"ansible_password=${var.winrm_password}\"",
            "--extra-vars", "\"vcenter_username=${var.vcenter_username}\"",
            "--extra-vars", "\"vcenter_password=${var.vcenter_password}\"",
            "--extra-vars", "ansible_shell_type=powershell",
            "--extra-vars", "ansible_shell_executable=None",
            "--extra-vars", "ansible_connection=winrm",
            "--extra-vars", "ansible_winrm_transport=basic",
            "--extra-vars", "\"ansible_winrm_password=${var.winrm_password}\"",
            "--extra-vars", "\"ansible_port=${var.communicator_port}\"",
            "--extra-vars", "ansible_winrm_server_cert_validation=ignore"
        ]
        playbook_file = "ansible/playbooks/windows.yml"
        user = var.winrm_username
        use_proxy = false
    }




    provisioner "windows-update" {
        pause_before = "30s"
        search_criteria = "IsInstalled=0"
        filters = [
            "exclude:$_.Title -like '*VMware*'",
            "exclude:$_.Title -like '*Preview*'",
            "exclude:$_.Title -like '*Defender*'",
            "exclude:$_.InstallationBehavior.CanRequestUserInput",
            "include:$true"
        ]
        restart_timeout = "120m"
    }
}
