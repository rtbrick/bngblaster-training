03. Routing
===========

https://rtbrick.github.io/bngblaster/routing/index.html

.. image:: images/routing.png
    :alt: Routing

03.01. ISIS
-----------

https://rtbrick.github.io/bngblaster/routing/isis.html

.. code-block:: none

    # > Linux
    cd ~/bngblaster-training/03_routing/01_isis

    # Generate ISIS Topology
    lspgen -h
    lspgen --level 2 --area 49.0001/24 --connector 1720.1625.5011 -m isis.mrt

    # Start BNG Blaster
    bngblaster -S run.sock -C config.json -l isis


.. code-block:: none

    # > Linux
    cd ~/bngblaster-training/03_routing/01_isis
    bngblaster-cli run.sock isis-adjacencies


.. code-block:: none

    # > RBFS (op)
    show show isis neighbor
    show isis database
    show route
    show route summary

    # ping one of the nodes in the emualted ISIS network
    ping 192.168.0.0 source-ip 172.16.255.1


Checking the Grafana dashboard, you should see an increase in the route count.

Now you can play with the size of the emulated ISIS topology by increasing node count (``-c``) 
or amount of external routes (``-e``), where external routes are automatically equally distributed 
over all nodes. Meaning 1000 nodes with 1000 external routes results into one external route per node. 

.. code-block:: none

    # > Linux
    lspgen --level 2 --area 49.0001/24 --connector 1720.1600.0011 -m isis.mrt -c 1000 -e 1000


Now you can start the BNG Blaster again and verify the ISIS database, routes, and the Grafana dashboard.

03.02. OSPF
-----------

https://rtbrick.github.io/bngblaster/routing/ospf.html

.. code-block:: none

    # > Linux
    cd ~/bngblaster-training/03_routing/02_ospf

    # Generate OSPF Topology
    lspgen -h
    lspgen -y --protocol ospf2 --connector 172.16.255.11:172.17.0.1 -m ospf2.mrt
    lspgen -y --protocol ospf3 --connector 172.16.255.11:172.17.0.1 -m ospf3.mrt

    # Start BNG Blaster
    bngblaster -S run.sock -C config.json -l ospf


.. code-block:: none

    # > Linux
    cd ~/bngblaster-training/03_routing/02_ospf

    bngblaster-cli run.sock ospf-neighbors instance 1
    bngblaster-cli run.sock ospf-neighbors instance 2
    bngblaster-cli run.sock ospf-neighbors instance 3
    bngblaster-cli run.sock ospf-neighbors instance 4


.. code-block:: none

    # > RBFS (op)
    show ospf neighbor
    show ospf database
    show route
    show route summary

    # ping one of the nodes in the emualted OSPF network
    ping 192.168.0.0 source-ip 172.16.255.1


03.03. LDP
----------

https://rtbrick.github.io/bngblaster/routing/ldp.html

.. code-block:: none

    # > Linux
    cd ~/bngblaster-training/03_routing/03_ldp

    # Generate ISIS Topology and LDP label mappings
    lspgen -y --level 2 --area 49.0001/24 --connector 1720.1625.5011 -e 10 -m isis.mrt
    ldpupdate -l 172.16.255.11 -p 192.168.0.0/32 -P 10 -M 10 -f update.ldp

    # Start BNG Blaster
    bngblaster -S run.sock -C config.json -l ldp


.. code-block:: none

    # > Linux
    cd ~/bngblaster-training/03_routing/03_ldp

    bngblaster-cli run.sock ldp-sessions
    bngblaster-cli run.sock ldp-database ldp-instance-id 1
    bngblaster-cli run.sock ldp-database ldp-instance-id 2


.. code-block:: none

    # > Linux
    cd ~/bngblaster-training/03_routing/03_ldp

    bngblaster-cli run.sock stream-info flow-id 1
    bngblaster-cli run.sock stream-info flow-id 2


Use ``jq`` to check received labels:

.. code-block:: none

    # > Linux
    cd ~/bngblaster-training/03_routing/03_ldp
    bngblaster-cli run.sock stream-info flow-id 1 | jq .'["stream-info"]["rx-mpls1"]'
    bngblaster-cli run.sock stream-info flow-id 2 | jq .'["stream-info"]["rx-mpls1"]'


03.04. BGP
----------

https://rtbrick.github.io/bngblaster/routing/bgp.html

03.05. Convergence
------------------

https://github.com/rtbrick/BGP-CP-DP-Testing