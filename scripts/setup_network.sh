#!/bin/sh 
# shellcheck disable=SC3043

# Creates a new virtual router on the host
create_virtual_router() {
    local guest_namespace=$1
    local veth_host_name=$2
    local veth_guest_name=$3
    local host_ip_range=$4
    local guest_ip_range=$5
    
    ip netns add "$guest_namespace"
    ip link add name "$veth_host_name" type veth peer name "$veth_guest_name"
    ip route add "$host_ip_range" dev "$veth_host_name"
    ip link set "$veth_guest_name" netns "$guest_namespace"
    ip netns exec "$guest_namespace" ip addr add "$guest_ip_range" dev "$veth_guest_name"
    ip netns exec "$guest_namespace" ip link set "$veth_guest_name" up
    ip netns exec "$guest_namespace" ip link set lo up
    ip link set "$veth_host_name" up
}


# Allocates an ip for a new guest
allocate_guest_ip() {
    local guest_namespace=$1
    local guest_ip=$2
    local veth_guest_name=$3

    ip netns exec "$guest_namespace" ip route add default via "$guest_ip" dev "$veth_guest_name"
}

