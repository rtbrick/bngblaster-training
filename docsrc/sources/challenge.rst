Challenge
=========

We’ve integrated a small challenge into the BNG Blaster training,
hiding **5 secrets** at various points throughout the exercises. 
All secrets follow the format ``SECRET_XX_XXXXXXXXXXXXXXX``. 

Participants can uncover these secrets by using **RBFS CLI commands**. 
The secrets are distributed across the training exercises, covering 
both **access** and **routing** scenarios.

Happy hunting! 🚀

.. raw:: html

    <style>
        .input-field {
            margin-bottom: 15px;
        }
        .input-field input {
            width: 400px;
            padding: 5px;
            margin-right: 10px;
        }
        .input-field span {
            font-weight: bold;
        }
        .verified {
            background-color: #e0e0e0;
            color: #000;
        }
        .success {
            color: black;
            font-size: 1.2em;
            margin-top: 20px;
        }
    </style>

    <script src="https://cdnjs.cloudflare.com/ajax/libs/crypto-js/4.1.1/crypto-js.min.js"></script>
    <script>
        const validatedFields = new Set();

        function validate(inputId, hash) {

            const inputElement = document.getElementById(inputId);
            const statusElement = document.getElementById(`status-${inputId}`);
            const value = inputElement.value;

            // Compute SHA256 hash of input value
            const computedHash = CryptoJS.SHA256(value).toString(CryptoJS.enc.Hex);

            if (computedHash === hash) {
                inputElement.classList.add("verified");
                inputElement.disabled = true;
                statusElement.textContent = "Verified";
                statusElement.style.color = "green";

                validatedFields.add(inputId);

                // Check if all fields are verified
                if (validatedFields.size === 5) {
                    document.getElementById("form-container").style.display = "none";
                    document.getElementById("congratulations").style.display = "block";
                }
            } else {
                statusElement.textContent = "Invalid";
                statusElement.style.color = "red";
            }
        }
    </script>
    <div id="form-container">
        <div class="input-field" id="field-01">
            <label for="secret01">SECRET_01:</label>
            <input type="text" id="secret01" />
            <button onclick="validate('secret01', 'ebfa6663c8ed8e77d9f91aeb5337e812116a436f46e68e5ddaec994ee922b484')">Check</button>
            <span id="status-secret01"></span>
        </div>
        <div class="input-field" id="field-02">
            <label for="secret02">SECRET_02:</label>
            <input type="text" id="secret02" />
            <button onclick="validate('secret02', '35804f461f5992b46bf43d825327d654c018b8bf60ae1c49c3f33254df939564')">Check</button>
            <span id="status-secret02"></span>
        </div>
        <div class="input-field" id="field-03">
            <label for="secret03">SECRET_03:</label>
            <input type="text" id="secret03" />
            <button onclick="validate('secret03', '5f2b14a43a63bd23c0f2651b4558078f57591d4036a6c28fc489c599af347f2d')">Check</button>
            <span id="status-secret03"></span>
        </div>
        <div class="input-field" id="field-04">
            <label for="secret04">SECRET_04:</label>
            <input type="text" id="secret04" />
            <button onclick="validate('secret04', 'c7ee6e59a790a07a23638f7c7fa571d3420ae4136cb73b6ece20cab583fadf9e')">Check</button>
            <span id="status-secret04"></span>
        </div>
        <div class="input-field" id="field-05">
            <label for="secret05">SECRET_05:</label>
            <input type="text" id="secret05" />
            <button onclick="validate('secret05', '33a256a96b1d0f76402b9fa1c9f4f04bd6446650c193c9650705dde75664fa0c')">Check</button>
            <span id="status-secret05"></span>
        </div>
    </div>
    <div id="congratulations" class="success" style="display: none;">
        <img src="_images/network_detective.png" alt="Network Detective" style="margin-top:20px; max-width:50%; height:auto;"/>
        <br>
        Elementary, my dear engineer. Hidden in packets, configs, 
        and traces were clues only a real BNG mind could find. 
        You, my friend, have earned your seat in the network detective club.
        <br>
    </div>


.. note:: 

    The form requires the complete secret in the format ``SECRET_XX_XXXXXXXXXXXXXXX``. 
    Ensure there are no leading or trailing whitespaces.
