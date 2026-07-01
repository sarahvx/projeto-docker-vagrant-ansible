# Projeto 02 - Infraestrutura Automatizada de Servidores

Este projeto automatiza o provisionamento e a configuração de um ambiente web multi-container utilizando Vagrant, Ansible e Docker. A infraestrutura foi projetada para implantar um site WordPress funcional integrado a um banco de dados MySQL e protegido por um proxy reverso Nginx configurado em Camada 4.

## Arquitetura do Projeto

A solução é composta por 4 arquivos principais:

* **Vagrantfile**: Define e inicializa a máquina virtual base (Debian 12) com IP fixo privado na rede host-only.
* **playbook_ansible.yml**: Automatiza a instalação do Docker, Docker Compose e o deploy da aplicação dentro da VM.
* **Dockerfile**: Constrói a imagem personalizada do Nginx, incluindo ferramentas adicionais de rede (ping e curl) e a configuração de proxy TCP.
* **docker-compose.yml**: Gerencia os containers da aplicação, isolando o banco de dados e o servidor web na rede interna e expondo apenas o proxy.

## Pré-requisitos

Antes de iniciar, certifique-se de ter instalado em sua máquina real:
* VirtualBox
* Vagrant
* Ansible

## Como Executar o Projeto

1. Clone este repositório para o seu computador local.
2. Certifique-se de que a imagem personalizada do proxy já está publicada no Docker Hub e configurada no arquivo docker-compose.yml.
3. No terminal da pasta do projeto, execute o comando para iniciar e provisionar a máquina virtual:
   ```bash
   vagrant up