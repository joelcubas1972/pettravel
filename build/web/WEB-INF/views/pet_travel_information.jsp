<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <title>Pet Owner Worksheet – International Travel</title>
        <!-- Bootstrap -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
        <style>
            body {
                background-color: #f4f6f9;
            }
            .card {
                border-radius: 12px;
            }
            .section-title {
                font-weight: 600;
                color: #2c3e50;
                margin-top: 30px;
            }
            label {
                font-weight: 500;
            }
            .hidden {
                display: none;
            }
        </style>
    </head>
    <body>
        <div class="container py-4">
            <div class="card shadow">
                <div class="card-body">

                    <h3 class="text-center mb-3">
                        Pet Owner Worksheet for Preparing Visit with Accredited Veterinarian
                    </h3>

                    <p class="text-muted text-center">
                        Complete this form before meeting with the USDA Accredited Veterinarian
                    </p>

                    <a href="<%= request.getContextPath()%>/index.jsp" class="btn btn-secondary btn-lg">⬅ Back to Home</a>

                    <form id="petTravelForm" enctype="multipart/form-data">

                        <!-- 1. Destination -->
                        <div class="section-title">1. Destination Country</div>
                        <label for="destinationCountry">Country</label>
                        <input type="text" id="destinationCountry" name="destinationCountry" class="form-control mb-3" required>

                        <!-- 2. Who is accompanying -->
                        <div class="section-title">2. Who is accompanying the pet?</div>
                        <label for="accompanyingPerson">Select</label>
                        <select name="accompanyingPerson" id="accompanyingPerson" class="form-select mb-3" required>
                            <option value="">Select an option</option>
                            <option value="OWNER">The owner</option>
                            <option value="AUTHORIZED">A person authorized by the owner</option>
                            <option value="NO_ONE">No one</option>
                            <option value="TRANSPORT_COMPANY">Pet transport company</option>
                        </select>

                        <!-- 3. Address -->
                        <div class="section-title">3. Address in Destination Country</div>
                        <label for="destinationAddress">Address</label>
                        <textarea id="destinationAddress" name="destinationAddress" class="form-control mb-3" rows="3" required></textarea>

                        <!-- 4. Travel method -->
                        <div class="section-title">4. How is your pet leaving the United States?</div>
                        <div class="row mb-3">
                            <div class="col-md-4">
                                <label for="travelMethod">Travel Method</label>
                                <select name="travelMethod" id="travelMethod" class="form-select" >
                                    <option value="">Select</option>
                                    <option value="AIR_DIRECT">Air – Direct Flight</option>
                                    <option value="AIR_LAYOVER">Air – Layovers</option>
                                    <option value="CAR">Car</option>
                                    <option value="TRAIN">Train</option>
                                    <option value="BOAT_DIRECT">Boat – Direct</option>
                                    <option value="CRUISE">Cruise ship</option>
                                </select>
                            </div>
                            <div class="col-md-8" id="travelDetailsContainer" style="display:none;">
                                <label for="travelDetails">Details</label>
                                <textarea id="travelDetails" name="travelDetails" class="form-control" rows="2" placeholder="Specify layover countries or cruise stops"></textarea>
                            </div>
                        </div>

                        <!-- 5. Departure -->
                        <div class="section-title">5. Departure Date & Location</div>
                        <div class="row mb-3">
                            <div class="col-md-6">
                                <label for="departureDate">Date</label>
                                <input type="date" id="departureDate" name="departureDate" class="form-control">
                            </div>
                            <div class="col-md-6">
                                <label for="departurePort">Departure Port / Airport</label>
                                <input type="text" id="departurePort" name="departurePort" class="form-control">
                            </div>
                        </div>

                        <!-- 6. Arrival -->
                        <div class="section-title">6. Arrival Date</div>
                        <div class="row mb-3">
                            <div class="col-md-6">
                                <label for="arrivalDateOwner">Owner Arrival</label>
                                <input type="date" id="arrivalDateOwner" name="arrivalDateOwner" class="form-control" required>
                            </div>
                            <div class="col-md-6">
                                <label for="arrivalDatePet">Pet Arrival</label>
                                <input type="date" id="arrivalDatePet" name="arrivalDatePet" class="form-control" required>
                            </div>
                        </div>

                        <!-- 7. Number of pets -->
                        <div class="section-title">7. Number of pets traveling</div>
                        <label for="numPets">Number of pets</label>
                        <input type="number" name="numberOfPets" class="form-control mb-3" min="1" max="5" id="numPets" required>

                        <!-- 8. Type of pet -->
                        <div class="section-title">8. Type of pet</div>
                        <div class="row mb-3">
                            <div class="col-md-4">
                                <div class="form-check">
                                    <input type="checkbox" name="petType" value="Dog" class="form-check-input" id="petDog" >
                                    <label class="form-check-label" for="petDog">Dog</label>
                                </div>
                                <div class="form-check">
                                    <input type="checkbox" name="petType" value="Cat" class="form-check-input" id="petCat" >
                                    <label class="form-check-label" for="petCat">Cat</label>
                                </div>
                                <!-- Oculto resto de especies -->
                                <div class="form-check hidden">
                                    <input type="checkbox" name="petType" value="Ferret" id="petFerret">
                                    <label for="petFerret">Ferret</label>
                                </div>
                                <div class="form-check hidden">
                                    <input type="checkbox" name="petType" value="Bird" id="petBird">
                                    <label for="petBird">Bird</label>
                                </div>
                                <div class="form-check hidden">
                                    <input type="checkbox" name="petType" value="Rodent" id="petRodent">
                                    <label for="petRodent">Rodent</label>
                                </div>
                                <div class="form-check hidden">
                                    <input type="checkbox" name="petType" value="Hedgehog" id="petHedgehog">
                                    <label for="petHedgehog">Hedgehog</label>
                                </div>
                                <div class="form-check hidden">
                                    <input type="checkbox" name="petType" value="Rabbit" id="petRabbit">
                                    <label for="petRabbit">Rabbit</label>
                                </div>
                                <div class="form-check hidden">
                                    <input type="checkbox" name="petType" value="Reptile" id="petReptile">
                                    <label for="petReptile">Reptile</label>
                                </div>
                                <div class="form-check hidden">
                                    <input type="checkbox" name="petType" value="Amphibian" id="petAmphibian">
                                    <label for="petAmphibian">Amphibian</label>
                                </div>
                            </div>
                        </div>

                        <!-- 9. Pet Information (Unified) -->
                        <div class="section-title">9. Pet Information</div>                
                        <div id="petsContainer">
                            <!-- PET 1 -->
                            <div class="card mb-3 pet-row">
                                <div class="card-body">
                                    <h6 class="fw-bold">Pet 1</h6>

                                    <div class="row mb-2">
                                        <div class="col-md-4">
                                            <label>Pet Name</label>
                                            <input type="text" name="petName1" class="form-control">
                                        </div>

                                        <div class="col-md-4">
                                            <label>Age at travel</label>
                                            <input type="text" name="petAge1" class="form-control" placeholder="e.g. 3 years">
                                        </div>
                                        <div class="col-md-4">
                                            <label>Size</label>
                                            <select name="petSize1" class="form-select">
                                                <option value="">Select</option>
                                                <option value="SMALL">Small</option>
                                                <option value="MEDIUM">Medium</option>
                                                <option value="LARGE">Large</option>
                                            </select>
                                        </div>
                                    </div>
                                    <!-- Microchip -->
                                    <div class="row mb-2">
                                        <div class="col-md-6">
                                            <label>Microchip #</label>
                                            <input type="text" name="petChip1" class="form-control">
                                        </div>
                                        <div class="col-md-6">
                                            <label>Microchip Implant Date</label>
                                            <input type="date" name="petChipDate1" class="form-control">
                                        </div>
                                    </div>
                                    <!-- Rabies -->
                                    <div class="row">
                                        <div class="col-md-6">
                                            <label>Rabies Status</label>
                                            <select name="rabiesStatus1" class="form-select rabiesSelect">
                                                <option value="">Select</option>
                                                <option value="SAME_VET">Administered by certifying veterinarian</option>
                                                <option value="OTHER_VET">Administered by another veterinarian</option>
                                                <option value="UNKNOWN">I don’t know</option>
                                                <option value="NOT_VACCINATED">Not vaccinated</option>
                                            </select>
                                        </div>
                                        <div class="col-md-6">
                                            <label>Rabies Vaccination Date</label>
                                            <input type="date" name="rabiesDate1" class="form-control rabiesDate">
                                        </div>
                                    </div>

                                </div>
                            </div>
                            <!-- PET 2 -->
                            <div class="card mb-3 pet-row">
                                <div class="card-body">
                                    <h6 class="fw-bold">Pet 2</h6>
                                    <div class="row mb-2">
                                        <div class="col-md-4">
                                            <label>Pet Name</label>
                                            <input type="text" name="petName2" class="form-control">
                                        </div>
                                        <div class="col-md-4">
                                            <label>Age at travel</label>
                                            <input type="text" name="petAge2" class="form-control" placeholder="e.g. 3 years">
                                        </div>
                                        <div class="col-md-4">
                                            <label>Size</label>
                                            <select name="petSize2" class="form-select">
                                                <option value="">Select</option>
                                                <option value="SMALL">Small</option>
                                                <option value="MEDIUM">Medium</option>
                                                <option value="LARGE">Large</option>
                                            </select>
                                        </div>
                                    </div>
                                    <!-- Microchip -->
                                    <div class="row mb-2">
                                        <div class="col-md-6">
                                            <label>Microchip #</label>
                                            <input type="text" name="petChip2" class="form-control">
                                        </div>
                                        <div class="col-md-6">
                                            <label>Microchip Implant Date</label>
                                            <input type="date" name="petChipDate2" class="form-control">
                                        </div>
                                    </div>
                                    <!-- Rabies -->
                                    <div class="row">
                                        <div class="col-md-6">
                                            <label>Rabies Status</label>
                                            <select name="rabiesStatus2" class="form-select rabiesSelect">
                                                <option value="">Select</option>
                                                <option value="SAME_VET">Administered by certifying veterinarian</option>
                                                <option value="OTHER_VET">Administered by another veterinarian</option>
                                                <option value="UNKNOWN">I don’t know</option>
                                                <option value="NOT_VACCINATED">Not vaccinated</option>
                                            </select>
                                        </div>
                                        <div class="col-md-6">
                                            <label>Rabies Vaccination Date</label>
                                            <input type="date" name="rabiesDate2" class="form-control rabiesDate">
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!-- PET 3 -->
                            <div class="card mb-3 pet-row">
                                <div class="card-body">
                                    <h6 class="fw-bold">Pet 3</h6>

                                    <div class="row mb-2">
                                        <div class="col-md-4">
                                            <label>Pet Name</label>
                                            <input type="text" name="petName3" class="form-control">
                                        </div>

                                        <div class="col-md-4">
                                            <label>Age at travel</label>
                                            <input type="text" name="petAge3" class="form-control" placeholder="e.g. 3 years">
                                        </div>
                                        <div class="col-md-4">
                                            <label>Size</label>
                                            <select name="petSize3" class="form-select">
                                                <option value="">Select</option>
                                                <option value="SMALL">Small</option>
                                                <option value="MEDIUM">Medium</option>
                                                <option value="LARGE">Large</option>
                                            </select>
                                        </div>
                                    </div>
                                    <!-- Microchip -->
                                    <div class="row mb-2">
                                        <div class="col-md-6">
                                            <label>Microchip #</label>
                                            <input type="text" name="petChip3" class="form-control">
                                        </div>
                                        <div class="col-md-6">
                                            <label>Microchip Implant Date</label>
                                            <input type="date" name="petChipDate3" class="form-control">
                                        </div>
                                    </div>
                                    <!-- Rabies -->
                                    <div class="row">
                                        <div class="col-md-6">
                                            <label>Rabies Status</label>
                                            <select name="rabiesStatus3" class="form-select rabiesSelect">
                                                <option value="">Select</option>
                                                <option value="SAME_VET">Administered by certifying veterinarian</option>
                                                <option value="OTHER_VET">Administered by another veterinarian</option>
                                                <option value="UNKNOWN">I don’t know</option>
                                                <option value="NOT_VACCINATED">Not vaccinated</option>
                                            </select>
                                        </div>
                                        <div class="col-md-6">
                                            <label>Rabies Vaccination Date</label>
                                            <input type="date" name="rabiesDate3" class="form-control rabiesDate">
                                        </div>
                                    </div>

                                </div>
                            </div>
                            <!-- PET 4 -->
                            <div class="card mb-3 pet-row">
                                <div class="card-body">
                                    <h6 class="fw-bold">Pet 4</h6>
                                    <div class="row mb-2">
                                        <div class="col-md-4">
                                            <label>Pet Name</label>
                                            <input type="text" name="petName4" class="form-control">
                                        </div>
                                        <div class="col-md-4">
                                            <label>Age at travel</label>
                                            <input type="text" name="petAge4" class="form-control" placeholder="e.g. 3 years">
                                        </div>
                                        <div class="col-md-4">
                                            <label>Size</label>
                                            <select name="petSize4" class="form-select">
                                                <option value="">Select</option>
                                                <option value="SMALL">Small</option>
                                                <option value="MEDIUM">Medium</option>
                                                <option value="LARGE">Large</option>
                                            </select>
                                        </div>
                                    </div>
                                    <!-- Microchip -->
                                    <div class="row mb-2">
                                        <div class="col-md-6">
                                            <label>Microchip #</label>
                                            <input type="text" name="petChip4" class="form-control">
                                        </div>
                                        <div class="col-md-6">
                                            <label>Microchip Implant Date</label>
                                            <input type="date" name="petChipDate4" class="form-control">
                                        </div>
                                    </div>
                                    <!-- Rabies -->
                                    <div class="row">
                                        <div class="col-md-6">
                                            <label>Rabies Status</label>
                                            <select name="rabiesStatus4" class="form-select rabiesSelect">
                                                <option value="">Select</option>
                                                <option value="SAME_VET">Administered by certifying veterinarian</option>
                                                <option value="OTHER_VET">Administered by another veterinarian</option>
                                                <option value="UNKNOWN">I don’t know</option>
                                                <option value="NOT_VACCINATED">Not vaccinated</option>
                                            </select>
                                        </div>
                                        <div class="col-md-6">
                                            <label>Rabies Vaccination Date</label>
                                            <input type="date" name="rabiesDate4" class="form-control rabiesDate">
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!-- PET 5 -->
                            <div class="card mb-3 pet-row">
                                <div class="card-body">
                                    <h6 class="fw-bold">Pet 5</h6>
                                    <div class="row mb-2">
                                        <div class="col-md-4">
                                            <label>Pet Name</label>
                                            <input type="text" name="petName5" class="form-control">
                                        </div>
                                        <div class="col-md-4">
                                            <label>Age at travel</label>
                                            <input type="text" name="petAge5" class="form-control" placeholder="e.g. 3 years">
                                        </div>
                                        <div class="col-md-4">
                                            <label>Size</label>
                                            <select name="petSize5" class="form-select">
                                                <option value="">Select</option>
                                                <option value="SMALL">Small</option>
                                                <option value="MEDIUM">Medium</option>
                                                <option value="LARGE">Large</option>
                                            </select>
                                        </div>
                                    </div>
                                    <!-- Microchip -->
                                    <div class="row mb-2">
                                        <div class="col-md-6">
                                            <label>Microchip #</label>
                                            <input type="text" name="petChip5" class="form-control">
                                        </div>
                                        <div class="col-md-6">
                                            <label>Microchip Implant Date</label>
                                            <input type="date" name="petChipDate5" class="form-control">
                                        </div>
                                    </div>
                                    <!-- Rabies -->
                                    <div class="row">
                                        <div class="col-md-6">
                                            <label>Rabies Status</label>
                                            <select name="rabiesStatus5" class="form-select rabiesSelect">
                                                <option value="">Select</option>
                                                <option value="SAME_VET">Administered by certifying veterinarian</option>
                                                <option value="OTHER_VET">Administered by another veterinarian</option>
                                                <option value="UNKNOWN">I don’t know</option>
                                                <option value="NOT_VACCINATED">Not vaccinated</option>
                                            </select>
                                        </div>
                                        <div class="col-md-6">
                                            <label>Rabies Vaccination Date</label>
                                            <input type="date" name="rabiesDate5" class="form-control rabiesDate">
                                        </div>
                                    </div>
                                </div>
                            </div>                    
                        </div>

                        <!-- 10. Import Permit -->
                        <div class="section-title">10. Does your destination country require an import permit?</div>
                        <label for="importPermit">Select</label>
                        <select name="importPermit" id="importPermit" class="form-select mb-3" >
                            <option value="YES">Yes</option>
                            <option value="NO">No</option>
                            <option value="UNKNOWN">I don’t know</option>
                        </select>
                        <label for="importFilesContainer">Upload files</label>
                        <input type="file" name="importFiles" id="importFilesContainer" class="form-control mb-3" multiple accept=".pdf,.docx,.xlsx,.txt,.jpg,.jpeg,.png">

                        <!-- 11. Additional Requirements -->
                        <div class="section-title">11. Airline / Cruise additional requirements</div>
                        <label for="additionalRequirements">Select</label>
                        <select name="additionalRequirements" id="additionalRequirements" class="form-select mb-3" >
                            <option value="YES">Yes – will provide to veterinarian</option>
                            <option value="NO">No</option>
                        </select>
                        <label for="additionalFilesContainer">Upload files</label>
                        <input type="file" name="additionalFiles" id="additionalFilesContainer" class="form-control mb-3" multiple accept=".pdf,.docx,.xlsx,.txt,.jpg,.jpeg,.png">
                        
                        <!-- 12. Client Digital Signature -->
                        <div class="section-title">12. Client Digital Signature</div>
                        <p>Use your mouse or digital pen to sign below:</p>
                        <canvas id="signature-pad" width="400" height="150" style="border:1px solid #000; border-radius:8px;"></canvas>
                        <br>
                        <button type="button" id="clear-signature" class="btn btn-sm btn-secondary mt-2">Clear</button>
                        <input type="hidden" name="clientSignatureBase64" id="clientSignatureBase64">
       
                    </form>

                    <!-- SUBMIT -->

                    <div class="text-center mt-4">
                        <button type="button" class="btn btn-info btn-lg" onclick="previewPDF()">👀 Preview PDF</button>
                        <button type="button" class="btn btn-danger btn-lg" onclick="exportAndSendEmail()">
                            📄 Export PDF & Send Email
                        </button>
                    </div>

                </div>
            </div>
        </div>

        <script>
                            document.addEventListener("DOMContentLoaded", function () {

                                // ==============================
                                // 1️⃣ Travel details
                                // ==============================
                                const travelMethod = document.getElementById("travelMethod");
                                const travelDetailsContainer = document.getElementById("travelDetailsContainer");

                                travelMethod.addEventListener("change", function () {
                                    travelDetailsContainer.style.display =
                                            (this.value === "AIR_LAYOVER" || this.value === "CRUISE") ? "block" : "none";
                                });

                                // ==============================
                                // 2️⃣ Pet rows (UNIFICADO)
                                // ==============================
                                const numPetsInput = document.getElementById('numPets');
                                const petRows = document.querySelectorAll('.pet-row');

                                function updatePetRows() {
                                    const numPets = parseInt(numPetsInput.value) || 0;

                                    petRows.forEach((row, index) => {
                                        row.style.display = index < numPets ? "block" : "none";
                                    });
                                }

                                numPetsInput.addEventListener('input', updatePetRows);
                                updatePetRows();

                                // ==============================
                                // 3️⃣ Rabies date visibility (por mascota)
                                // ==============================
                                const rabiesSelects = document.querySelectorAll('.rabiesSelect');
                                const rabiesDates = document.querySelectorAll('.rabiesDate');

                                rabiesSelects.forEach((select, index) => {
                                    select.addEventListener('change', () => {
                                        if (rabiesDates[index]) {
                                            rabiesDates[index].style.display =
                                                    (select.value === 'SAME_VET' || select.value === 'OTHER_VET')
                                                    ? 'block'
                                                    : 'none';
                                        }
                                    });
                                });

                                // ==============================
                                // 4️⃣ Import permit files
                                // ==============================
                                const importPermitSelect = document.getElementById('importPermit');
                                const importFilesInput = document.getElementById('importFilesContainer');

                                importFilesInput.style.display = importPermitSelect.value === 'YES' ? 'block' : 'none';
                                importPermitSelect.addEventListener('change', () => {
                                    importFilesInput.style.display = (importPermitSelect.value === 'YES') ? 'block' : 'none';
                                });

                                // ==============================
                                // 5️⃣ Additional requirements files
                                // ==============================
                                const additionalSelect = document.getElementById('additionalRequirements');
                                const additionalFilesInput = document.getElementById('additionalFilesContainer');

                                additionalFilesInput.style.display = additionalSelect.value === 'YES' ? 'block' : 'none';
                                additionalSelect.addEventListener('change', () => {
                                    additionalFilesInput.style.display = (additionalSelect.value === 'YES') ? 'block' : 'none';
                                });

                                // ==============================
                                // 6️⃣ Preview PDF
                                // ==============================
                                window.previewPDF = async function () {
                                    const form = document.getElementById("petTravelForm");
                                    const formData = new FormData(form);
                                                                          
                                    // Capturar firma del canvas
                                    const dataURL = canvas.toDataURL("image/png");
                                    formData.set("clientSignatureBase64", dataURL);
    
                                    const response = await fetch('<%= request.getContextPath()%>/PdfExportServlet?preview=true', {
                                        method: 'POST',
                                        body: formData
                                    });
                                    const blob = await response.blob();
                                    const url = URL.createObjectURL(blob);
                                    window.open(url, '_blank');
                                };

                                // ==============================
                                // 7️⃣ Export PDF y enviar email
                                // ==============================
                                window.exportAndSendEmail = async function () {
                                    const form = document.getElementById("petTravelForm");
                                    const formData = new FormData(form);
                                    
                                    // Capturar firma del canvas
                                    const dataURL = canvas.toDataURL("image/png");
                                    formData.set("clientSignatureBase64", dataURL);
    
                                    const response = await fetch('<%= request.getContextPath() %>/PdfExportServlet', {
                                        method: 'POST',
                                        body: formData
                                    });

                                    const result = await response.json();
                                    result.ok
                                        ? alert("📧 Email enviado correctamente!")
                                        : alert("❌ Error al enviar email");
                                };

                                // ==============================
                                // 8️⃣ Helper Base64 → Blob
                                // ==============================
                                function b64toBlob(b64Data, contentType = '', sliceSize = 512) {
                                    const byteCharacters = atob(b64Data);
                                    const byteArrays = [];
                                    for (let offset = 0; offset < byteCharacters.length; offset += sliceSize) {
                                        const slice = byteCharacters.slice(offset, offset + sliceSize);
                                        const byteNumbers = new Array(slice.length);
                                        for (let i = 0; i < slice.length; i++) {
                                            byteNumbers[i] = slice.charCodeAt(i);
                                        }
                                        byteArrays.push(new Uint8Array(byteNumbers));
                                    }
                                    return new Blob(byteArrays, {type: contentType});
                                }
                                // ==============================
                                // 9️⃣ Client signature pad
                                // ==============================
                                const canvas = document.getElementById('signature-pad');
                                const ctx = canvas.getContext('2d');
                                let drawing = false;

                                canvas.addEventListener('mousedown', e => { drawing = true; ctx.beginPath(); ctx.moveTo(e.offsetX, e.offsetY); });
                                canvas.addEventListener('mouseup', () => drawing = false);
                                canvas.addEventListener('mouseout', () => drawing = false);
                                canvas.addEventListener('mousemove', e => {
                                    if (!drawing) return;
                                    ctx.lineTo(e.offsetX, e.offsetY);
                                    ctx.stroke();
                                });

                                // Clear button
                                document.getElementById('clear-signature').addEventListener('click', () => {
                                    ctx.clearRect(0, 0, canvas.width, canvas.height);
                                });

                                // Antes de enviar el formulario (preview o export)
                                document.getElementById('petTravelForm').addEventListener('submit', () => {
                                    const dataURL = canvas.toDataURL("image/png");
                                    document.getElementById('clientSignatureBase64').value = dataURL;
                                });

                            });
        </script>
    </body>
</html>
