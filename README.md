# Packer-Windows-Template

This repository helps automate the creation of windows virtual machine images on VMware vSphere using [HashiCorp Packer][packer] and the [Packer Plugin for VMware vSphere][packer-plugin-vsphere] (`vsphere-iso`). 

Credentials are needed for vsphere authentication and the user should be configured with the following permisions. Clone the default **Read-Only** vSphere role and add the following privileges:


| Category                 | Privilege                                           | Reference                                          |
| ---------------          | --------------------------------------------------- | -------------------------------------------------- |
| Content Library          | Add library item                                    | `ContentLibrary.AddLibraryItem`                    |
| ...                      | Update Library Item                                 | `ContentLibrary.UpdateLibraryItem`                 |
| Cryptographic Operations | Direct Access (Required for `packer_cache` upload.) | `Cryptographer.Access`                             |
| ...                      | Encrypt (Required for vTPM.)                        | `Cryptographer.Encrypt`                            |
| Datastore                | Allocate space                                      | `Datastore.AllocateSpace`                          |
| ...                      | Browse datastore                                    | `Datastore.Browse`                                 |
| ...                      | Low level file operations                           | `Datastore.FileManagement`                         |
| Host                     | Configuration > System Management                   | `Host.Config.SystemManagement`                     |
| Network                  | Assign network                                      | `Network.Assign`                                   |
| Resource                 | Assign virtual machine to resource pool             | `Resource.AssignVMToPool`                          |
| vApp                     | Export                                              | `vApp.Export`                                      |
| Virtual Machine          | Configuration > Add new disk                        | `VirtualMachine.Config.AddNewDisk`                 |
| ...                      | Configuration > Add or remove device                | `VirtualMachine.Config.AddRemoveDevice`            |
| ...                      | Configuration > Advanced configuration              | `VirtualMachine.Config.AdvancedConfig`             |
| ...                      | Configuration > Change CPU count                    | `VirtualMachine.Config.CPUCount`                   |
| ...                      | Configuration > Change memory                       | `VirtualMachine.Config.Memory`                     |
| ...                      | Configuration > Change settings                     | `VirtualMachine.Config.Settings`                   |
| ...                      | Configuration > Change Resource                     | `VirtualMachine.Config.Resource`                   |
| ...                      | Configuration > Modify device settings              | `VirtualMachine.Config.EditDevice`                 |
| ...                      | Configuration > Set annotation                      | `VirtualMachine.Config.Annotation`                 |
| ...                      | Edit Inventory > Create from existing               | `VirtualMachine.Inventory.CreateFromExisting`      |
| ...                      | Edit Inventory > Create new                         | `VirtualMachine.Inventory.Create`                  |
| ...                      | Edit Inventory > Remove                             | `VirtualMachine.Inventory.Delete`                  |
| ...                      | Interaction > Configure CD media                    | `VirtualMachine.Interact.SetCDMedia`               |
| ...                      | Interaction > Configure floppy media                | `VirtualMachine.Interact.SetFloppyMedia`           |
| ...                      | Interaction > Connect devices                       | `VirtualMachine.Interact.DeviceConnection`         |
| ...                      | Interaction > Inject USB HID scan codes             | `VirtualMachine.Interact.PutUsbScanCodes`          |
| ...                      | Interaction > Power off                             | `VirtualMachine.Interact.PowerOff`                 |
| ...                      | Interaction > Power on                              | `VirtualMachine.Interact.PowerOn`                  |
| ...                      | Provisioning > Create template from virtual machine | `VirtualMachine.Provisioning.CreateTemplateFromVM` |
| ...                      | Provisioning > Mark as template                     | `VirtualMachine.Provisioning.MarkAsTemplate`       |
| ...                      | Provisioning > Mark as virtual machine              | `VirtualMachine.Provisioning.MarkAsVM`             |
| ...                      | State > Create snapshot                             | `VirtualMachine.State.CreateSnapshot`              |


# Build Steps 
Create a variable file with values for the following variables 

```
vcenter_server=<value>
vcenter_username=<value>
vcenter_password=<value>
resource_pool=<value>
vsphere_datastore=<value>
vsphere_folder=<value>
winrm_username=<value>
winrm_password=<value>
iso_path=<value>
common_iso_datastore=<value>
vsphere_cluster=<value>
vsphere_network=<value>
```
Build command 
```
packer build -force -var-file=<variable file> build.pkr.hcl
```

# Credits
- [VMware Tools for Windows][credits-owen-reynolds-github] installation PowerShell script.
- [Packer Vsphere Example][https://github.com/vmware-samples/packer-examples-for-vsphere]
