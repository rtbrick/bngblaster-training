02. Access
==========

https://rtbrick.github.io/bngblaster/access/index.html

02.01. PPPoE
------------

https://rtbrick.github.io/bngblaster/access/pppoe.html

.. code-block:: none

    # > Linux
    cd ~/bngblaster-training/02_access/01_pppoe
    # Start BNG Blaster
    bngblaster -S run.sock -J report.json -j sessions -C config.json -I -c 1


.. note::

    The parameter ``-c 1`` defines how many sessions you would like to start. 
    You can increase this number to setup more sessions. 


.. code-block:: none

    # > RBFS (op)
    show subscriber detail
    show subscriber <subscriber-id> detail
    show subscriber count
    show pppoe session detail
    show pppoe session <subscriber-id> detail


In the other shell, use the following commands to interact 
with the active BNG Blaster instance.

.. code-block:: none

    # > Linux
    cd ~/bngblaster-training/02_access/01_pppoe
    bngblaster-cli run.sock session-info session-id 1


Use ``jq`` to check received reply-message:

.. code-block:: none

    # > Linux
    cd ~/bngblaster-training/02_access/01_pppoe
    bngblaster-cli run.sock session-info session-id 1 | jq .'["session-info"]["reply-message"]'


Check RADIUS logs.

.. code-block:: none

    cat /var/log/radius/detail.log


Checking the Grafana dashboard, you should see an increase in the subscriber count.

To stop the BNG Blaster, press ``Ctrl+C`` or use the command ``bngblaster-cli run.sock test-stop``.

After the test has stopped, use the following RBFS commands to investigate why subscribers were terminated. 
Start with these commands if a subscriber fails to connect or disconnects unexpectedly.

.. code-block:: none

    # > RBFS (op)
    show subscriber history


A list of all termination reasons can be found here:
https://documents.rtbrick.com/techdocs/current/radiusservices/radius_control.html#radius-terminate-codes


02.02. L2TP
-----------

https://rtbrick.github.io/bngblaster/access/l2tp.html

.. code-block:: none

    # > Linux
    cd ~/bngblaster-training/02_access/02_l2tp
    # Start BNG Blaster
    bngblaster -S run.sock -J report.json -j sessions -C config.json -I  -l l2tp -c 3


.. code-block:: none

    # > RBFS (op)
    show l2tp tunnel sessions
    show l2tp tunnel <Local TID>


To stop the BNG Blaster, press ``Ctrl+C`` or use the command ``bngblaster-cli run.sock test-stop``.

After the test has stopped, you can use the following RBFS commands to investigate why the tunnel and session were closed.

.. code-block:: none

    # > RBFS (op)
    show l2tp tunnel history
    show subscriber history filter type L2TP


02.03. IPoE (DHCP)
------------------

https://rtbrick.github.io/bngblaster/access/ipoe.html

.. code-block:: none

    # > Linux
    cd ~/bngblaster-training/02_access/03_ipoe
    # Start BNG Blaster
    bngblaster -S run.sock -J report.json -j sessions -C config.json -I -l dhcp -l ip -c 3


02.04. MIX
----------

This test generates a mix of PPPoE, L2TP, and IPoE (DHCP) subscribers.

.. code-block:: none

    # > Linux
    cd ~/bngblaster-training/02_access/04_mix
    # Start BNG Blaster
    bngblaster -S run.sock -J report.json -j sessions -C config.json -I -l ip -c 90


02.05. HTTP
-----------

This test is designed to evaluate the BNG HTTP redirect service, a common feature in modern BNG deployments.

In this scenario, the BNG Blaster functions as both an HTTP client and server. Once a subscriber is established, 
the BNG Blaster IPoE client initiates a TCP connection to the HTTP server. However, this connection is intercepted 
and terminated by the BNG, which is controlled via RADIUS and responds with an HTTP 302 redirect.

https://rtbrick.github.io/bngblaster/http.html

.. code-block:: none

    # > Linux
    cd ~/bngblaster-training/02_access/05_http
    # Start BNG Blaster
    bngblaster -S run.sock -C config.json -l http -c 1


In the other shell, use the following commands to interact with the active BNG Blaster instance.

.. code-block:: none

    # > Linux
    cd ~/bngblaster-training/02_access/05_http
    bngblaster-cli run.sock http-clients session-id 1


02.06. LAG
----------

https://rtbrick.github.io/bngblaster/interfaces.html#link-aggregation-lag

.. code-block:: none

    # > Linux
    cd ~/bngblaster-training/02_access/06_lag
    # Start BNG Blaster
    bngblaster -S run.sock -J report.json -j sessions -C config.json -I -l dhcp -l ip -c 3

.. note::

    You may see a warning like those below, which can be ignored. 

.. code-block:: none

    Nov 13 09:03:43.997147 Warning: Interfaces must not have an IP address configured in the host OS!
    Nov 13 09:03:43.997402 Warning: IP address fe80::fcdc:acff:fe79:fcd3 on interface r1-h5 is conflicting!
    Nov 13 09:03:44.040380 LAG (lag1) Interface r1-h5 added
    Nov 13 09:03:44.041093 Warning: IP address fe80::fced:cdff:fe5e:57a on interface r1-h6 is conflicting!
