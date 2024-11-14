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


The parameter ``-c 1`` defines how many sessions you would like to start. 
You can increase this number to setup more sessions. 

.. code-block:: none

    # > RBFS (op)
    show subscriber detail
    show pppoe session detail


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

.. code-block:: none

    # > Linux
    cd ~/bngblaster-training/02_access/04_mix
    # Start BNG Blaster
    bngblaster -S run.sock -J report.json -j sessions -C config.json -I -l ip -c 3


02.05. HTTP
-----------

.. code-block:: none

    # > Linux
    cd ~/bngblaster-training/02_access/05_http
    # Start BNG Blaster
    bngblaster -S run.sock -C config.json -l http -c 1


.. code-block:: none

    # > Linux
    cd ~/bngblaster-training/02_access/05_http
    bngblaster-cli run.sock http-clients session-id 1


02.06. LAG
----------

.. code-block:: none

    # > Linux
    cd ~/bngblaster-training/02_access/06_lag
    # Start BNG Blaster
    bngblaster -S run.sock -J report.json -j sessions -C config.json -I -l dhcp -l ip -c 3


You may see a warning like this, which can be ignored for now. 

.. code-block:: none

    Nov 13 09:03:43.997147 Warning: Interfaces must not have an IP address configured in the host OS!
    Nov 13 09:03:43.997402 Warning: IP address fe80::fcdc:acff:fe79:fcd3 on interface r1-h5 is conflicting!
    Nov 13 09:03:44.040380 LAG (lag1) Interface r1-h5 added
    Nov 13 09:03:44.041093 Warning: IP address fe80::fced:cdff:fe5e:57a on interface r1-h6 is conflicting!
