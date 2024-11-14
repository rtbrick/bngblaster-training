01. Basic
=========

01.01. Network Interfaces
-------------------------

https://rtbrick.github.io/bngblaster/interfaces.html#network-interfaces

Before starting the tests, use the RBFS BNG CLI to verify that all physical interfaces are operational and active

.. code-block:: none

    # > RBFS CLI (op)
    op> show interface physical


.. note::

    The `lag-1` interface is expected to be in an operational down state if the BNG Blaster LAG test is not running.


Now, enter the following command to start the BNG Blaster. It’s recommended to open the terminal in full-screen mode 
to ensure the complete ncurses UI fits on the screen.

.. code-block:: none

    # > Linux
    cd ~/bngblaster-training/01_basic/01_network_interfaces

    # Check BNG Blaster Help
    bngblaster -h

    # Start BNG Blaster
    bngblaster -I -S run.sock -C config.json -l debug


In the ncurses UI, press ``F2`` to toggle network interface statistics, or use ``F7`` and ``F8`` to start and stop traffic, respectively.

In the next step, we’ll interact with the BNG Blaster CLI (https://rtbrick.github.io/bngblaster/api/index.html). 

In the other shell, use the following commands to interact 
with the active BNG Blaster instance.

.. code-block:: none

    # > Linux
    cd ~/bngblaster-training/01_basic/01_network_interfaces
    bngblaster-cli run.sock interfaces
    bngblaster-cli run.sock network-interfaces

    # check traffic
    bngblaster-cli run.sock stream-summary
    bngblaster-cli run.sock stream-info flow-id 1
    bngblaster-cli run.sock stream-info flow-id 2


In the output of the ``stream-info`` command, locate ``rx-interface`` and verify that it matches the expected interface. Review the additional information displayed here, and feel free to experiment with other commands.

For the next steps, switch to the RBFS BNG CLI and use the following commands to check for neighbors and to ping the IP addresses of the BNG Blaster.

.. code-block:: none

    # > RBFS (op)
    show neighbor

    # ping BNG Blaster
    ping 172.16.2.2 source-ip 172.16.2.1


Now, let's add a static route with the BNG Blaster as the next hop and observe the results.

.. code-block:: none

    # > RBFS (op)
    switch-mode config

    # > RBFS (cfg)
    set instance default static nexthop-profile blaster-veth2-v4 nexthop 172.16.2.2
    set instance default static route ipv4 1.2.3.4/32 unicast blaster-veth2-v4
    commit switch-to-op 

    # > RBFS (op)
    ping 1.2.3.4 source-ip 172.16.2.1


The BNG Blaster responds to ICMP requests for all IP addresses, as long as the destination MAC address matches the BNG Blaster's MAC address. This functionality also extends to routes advertised by the BNG Blaster using routing protocols like ISIS.

To stop the BNG Blaster, press ``Ctrl+C`` or use the command ``bngblaster-cli run.sock test-stop``.

01.02. API
----------

https://rtbrick.github.io/bngblaster/controller.html

Create a new BNG Blaster instance. 

.. code-block:: none

    # > Linux
    cd ~/bngblaster-training/01_basic/02_api
    sh create.sh
    ls -l /var/bngblaster/E01_02_API/

Start the BNG Blaster instance. 

.. code-block:: none

    # > Linux
    sh start.sh

Send commands to the BNG Blaster instance. 

.. code-block:: none

    # > Linux
    sh command.sh


You can edit `command.sh` to experiment with other commands available at [BNG Blaster API](https://rtbrick.github.io/bngblaster/api/index.html).

Stop the BNG Blaster instance. 

.. code-block:: none

    # > Linux
    sh stop.sh


Delete the BNG Blaster instance. 

.. code-block:: none

    # > Linux
    sh delete.sh
    ls -l /var/bngblaster/


01.03. PCAP
-----------

https://rtbrick.github.io/bngblaster/troubleshooting.html#pcap

In this exercise, we will start the BNG Blaster with `-P test.pcap` to generate a PCAP file that includes
all traffic sent and received by the BNG Blaster. Normally, stream traffic would be excluded, but we've 
set `capture-include-streams` to `true` in the configuration so that stream traffic is also captured.

.. code-block:: none

    # > Linux
    cd ~/bngblaster-training/01_basic/03_pcap
    # Start BNG Blaster
    bngblaster -I -S run.sock -C config.json -l debug -P test.pcap


Wait for all flows to be verified (indicated by the log message `ALL STREAM TRAFFIC FLOWS VERIFIED`), 
then stop the process with `Ctrl+C`. Once the BNG Blaster has stopped, examine the PCAP file with tshark.

.. code-block:: none

    # > Linux
    tshark -X lua_script:/opt/bbl_header.lua -2 -R bng-blaster -O bng-blaster -r test.pcap


BNG Blaster Header: 
https://rtbrick.github.io/bngblaster/streams.html#bng-blaster-traffic
