Setup
=====

The image below illustrates the virtual test environment, featuring a virtual BNG 
powered by `RBFS <https://documents.rtbrick.com/techdocs/current/platform/intro.html>`_ 
running in a container. The interface pair ``veth1`` - ``hostif-0/0/1`` connects the BNG 
to the host, supporting protocols like RADIUS. The remaining interfaces are dedicated 
for use with the BNG Blaster.

.. image:: images/setup.png
    :alt: Setup

