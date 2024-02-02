#!/bin/bash
ansible-galaxy collection install kewlfft.aur
ansible-playbook arch-provision.yml
