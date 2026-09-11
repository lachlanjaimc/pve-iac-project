This project is to learn and develop my DevOps skills by creating and end-to-end IaC pipeline. I will define the entire environment running on the Proxmox hypervisor using Terraform and Ansible code, the the environment should be able to be easily destroyed and created while retaining all state.
## AI Usage

My goal with this project is to learn as much as possible and to retain the knowledge I gain. I will limit my AI usage and ask chatbots for assistance as a last resort. I want the problem solving process to be as human-driven as possible to allow for unexpected discoveries. However I would like to experiment with running an AI agent in my solution to explore the possibilities, both with local inference on a modest GPU in the server and cloud-based inference.
## Demo application

The environment shall be setup to deploy a demo application. The application should be split into a frontend layer, a backend layer and a database layer. This will allow each component to be deployed, updated and destroyed independently. Load balancing should also be used to demonstrate the flexibility of my solution. No IPs should be hardcoded and a DNS server will be used to allow communication via FQDN. It will be a simple CRUD application written either in C#/.NET or React/NodeJS. Every time the Terraform or Ansible code is updated, it should rebuild the environment based on which components have been changed.
## Monitoring

I will develop a monitoring solution with Grafana + Prometheus and come up with load generation tooling to create alert events. Runbook automation to resolve simple issues like stopped services, hung processes would also be good to demonstrate a resilient solution.
## Setting up Proxmox

I am using a server, which is a desktop built from spare parts. The specifications are as follows:

- 1x AMD Ryzen 5 5500 CPU
- 4x 8GB DDR4 2400MHz Memory
- 1x 256GB SATA M.2 SSD
- 2x 240GB SATA 2.5' SSD
- 1x NVIDIA GTX 1660 Ti

This hardware specification will allow separating hypervisor, VM and database disks and allow for scaling out to multiple VMs per layer. It will also open up the possibility for GPU accelerated tasks such as AI inference.
### Installation

I installed the Proxmox VE as standard, disabling the enterprise repos and enabling the non-subscriptions equivalents, then updating the system and rebooting if the kernel was updated.

![[disk_setup.png]]

I set up one of the 240GB SSDs for VM and CT disks. This will ensure the hypervisor gets the full speed and IO of the boot drive
