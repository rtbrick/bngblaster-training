BNG Blaster Training
====================

The BNG Blaster training is splited into three sections:

1. **Basics**: The first section covers foundational concepts to ensure participants have a solid understanding of the fundamentals.

2. **Access Protocols**: The second section focuses on access protocols such as PPPoE, IPoE, and others, providing insight into how these protocols function in a BNG environment. You will learn how to emulate these protocols using BNG Blaster, including configuring the appropriate settings and generating realistic traffic patterns to simulate real-world scenarios.

3. **Routing Protocols**: The third section explores routing protocols, including BGP, ISIS, and more, helping participants understand how to test routing protocols, scaling, and convergence to evaluate network performance and stability.

For most exercises in this training, you’ll need to establish three separate SSH connections. 
Begin by opening three SSH sessions to your setup. Use the first session to launch the BNG Blaster, 
the second to interact with the BNG Blaster through its CLI, and the third to connect to the BNG CLI,
which represents our device under test (DUT) running `RBFS <https://documents.rtbrick.com/techdocs/current/platform/intro.html>`_.

Throughout the exercises, commands will be provided. The initial line, marked with `# >`, 
specifies whether commands should be entered in the host shell or within the RBFS CLI, 
and also indicates the necessary mode (op or cfg).

.. code-block:: none

   # > Linux

   # > RBFS CLI (op)

   # > RBFS CLI (cfg)



Contents
--------

.. toctree::
   :maxdepth: 1

   setup
   basic
   access
   routing

Contact
-------

* Mail: bngblaster@rtbrick.com
* Chat: `matrix.org #bngblaster <https://matrix.to/#/#bngblaster:matrix.org>`_

License
-------

BNG Blaster is licensed under the BSD 3-Clause License, which means that you are free to get and use it for
commercial and non-commercial purposes as long as you fulfill its conditions.

See the `LICENSE <https://github.com/rtbrick/bngblaster-training/blob/main/LICENSE>`_ 
file for more details.

Copyright
---------
.. |copy|   unicode:: U+000A9 .. COPYRIGHT SIGN

Copyright |copy| 2020-2024, RtBrick, Inc.