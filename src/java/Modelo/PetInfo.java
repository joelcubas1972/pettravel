package Modelo;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

public class PetInfo implements Serializable {
    private String ownerName;
    private String ownerEmail;
    private String ownerPhone;
    private String ownerAddress;
    private String ownerState;
    private String ownerCity;
    private String ownerZipCode;
    
    private String petName;
    private String petType;
    private String petBreed;
    private String petColor;
    private String petGender;
    private Date petBirthDate;
    private String microchipNumber;
    

    private String vetName;
    private String vetLicense;
    private String clinicName;
    private String clinicAddress;
    
    private List<Vaccine> vaccines;
    private String destinationCountry;
    private Date travelDate;
    private Date regresoDate;
    private String travelType;
    private String lugar;
    
    private boolean vaccinated;
    private Date lastVaccinationDate;
    private boolean rabiesVaccinated;
    private Date rabiesVaccinationDate;
    
    private boolean healthCertificateRequired;
    
    // Constructors
    public PetInfo() {}

    public PetInfo(String ownerName, String ownerEmail, String ownerPhone, String ownerAddress, String ownerState, String ownerCity, String ownerZipCode, String petName, String petType, String petBreed, String petColor, String petGender, Date petBirthDate, String microchipNumber, String vetName, String vetLicense, String clinicName, String clinicAddress, List<Vaccine> vaccines, String destinationCountry, Date travelDate, Date regresoDate, String travelType, String lugar, boolean vaccinated, Date lastVaccinationDate, boolean rabiesVaccinated, Date rabiesVaccinationDate, boolean healthCertificateRequired) {
        this.ownerName = ownerName;
        this.ownerEmail = ownerEmail;
        this.ownerPhone = ownerPhone;
        this.ownerAddress = ownerAddress;
        this.ownerState = ownerState;
        this.ownerCity = ownerCity;
        this.ownerZipCode = ownerZipCode;
        this.petName = petName;
        this.petType = petType;
        this.petBreed = petBreed;
        this.petColor = petColor;
        this.petGender = petGender;
        this.petBirthDate = petBirthDate;
        this.microchipNumber = microchipNumber;
        this.vetName = vetName;
        this.vetLicense = vetLicense;
        this.clinicName = clinicName;
        this.clinicAddress = clinicAddress;
        this.vaccines = vaccines;
        this.destinationCountry = destinationCountry;
        this.travelDate = travelDate;
        this.regresoDate = regresoDate;
        this.travelType = travelType;
        this.lugar = lugar;
        this.vaccinated = vaccinated;
        this.lastVaccinationDate = lastVaccinationDate;
        this.rabiesVaccinated = rabiesVaccinated;
        this.rabiesVaccinationDate = rabiesVaccinationDate;
        this.healthCertificateRequired = healthCertificateRequired;
    }

    
    // Getters y Setters (generar automáticamente en IDE)
    public String getOwnerName() { return ownerName; }
    public void setOwnerName(String ownerName) { this.ownerName = ownerName; }
    
    public String getOwnerEmail() { return ownerEmail; }
    public void setOwnerEmail(String ownerEmail) { this.ownerEmail = ownerEmail; }
    
    public String getOwnerPhone() { return ownerPhone; }
    public void setOwnerPhone(String ownerPhone) { this.ownerPhone = ownerPhone; }
    
    public String getOwnerAddress() { return ownerAddress; }
    public void setOwnerAddress(String ownerAddress) { this.ownerAddress = ownerAddress; }

    public String getOwnerState() { return ownerState; }
    public void setOwnerState(String ownerState) { this.ownerState = ownerState; }

    public String getOwnerCity() { return ownerCity; }
    public void setOwnerCity(String ownerCity) { this.ownerCity = ownerCity; }

    public String getOwnerZipCode() { return ownerZipCode; }
    public void setOwnerZipCode(String ownerZipCode) { this.ownerZipCode = ownerZipCode; }
    
    public String getPetName() { return petName; }
    public void setPetName(String petName) { this.petName = petName; }
    
    public String getPetType() { return petType; }
    public void setPetType(String petType) { this.petType = petType; }
    
    public String getPetBreed() { return petBreed; }
    public void setPetBreed(String petBreed) { this.petBreed = petBreed; }
    
    public String getPetColor() { return petColor; }
    public void setPetColor(String petColor) { this.petColor = petColor; }
    
    public String getPetGender() { return petGender; }
    public void setPetGender(String petGender) { this.petGender = petGender; }
    
    public Date getPetBirthDate() { return petBirthDate; }
    public void setPetBirthDate(Date petBirthDate) { this.petBirthDate = petBirthDate; }
    
    public String getMicrochipNumber() { return microchipNumber; }
    public void setMicrochipNumber(String microchipNumber) { this.microchipNumber = microchipNumber; }
    
    public String getDestinationCountry() { return destinationCountry; }
    public void setDestinationCountry(String destinationCountry) { this.destinationCountry = destinationCountry; }
    
    public Date getTravelDate() { return travelDate; }
    public void setTravelDate(Date travelDate) { this.travelDate = travelDate; }

    public Date getRegresoDate() { return regresoDate; }
    public void setRegresoDate(Date regresoDate) { this.regresoDate = regresoDate; }
    
    public String getTravelType() { return travelType; }
    public void setTravelType(String travelType) { this.travelType = travelType; }

    public String getLugar() { return lugar; }
    public void setLugar(String lugar) { this.lugar = lugar; }
    
    public boolean isVaccinated() { return vaccinated; }
    public void setVaccinated(boolean vaccinated) { this.vaccinated = vaccinated; }
    
    public Date getLastVaccinationDate() { return lastVaccinationDate; }
    public void setLastVaccinationDate(Date lastVaccinationDate) { this.lastVaccinationDate = lastVaccinationDate; }
    
    public boolean isRabiesVaccinated() { return rabiesVaccinated; }
    public void setRabiesVaccinated(boolean rabiesVaccinated) { this.rabiesVaccinated = rabiesVaccinated; }
    
    public Date getRabiesVaccinationDate() { return rabiesVaccinationDate; }
    public void setRabiesVaccinationDate(Date rabiesVaccinationDate) { this.rabiesVaccinationDate = rabiesVaccinationDate; }
    
    public boolean isHealthCertificateRequired() { return healthCertificateRequired; }
    public void setHealthCertificateRequired(boolean healthCertificateRequired) { this.healthCertificateRequired = healthCertificateRequired; }

    public String getVetName() { return vetName; }
    public void setVetName(String vetName) { this.vetName = vetName; }

    public String getVetLicense() { return vetLicense;}
    public void setVetLicense(String vetLicense) { this.vetLicense = vetLicense; }

    public String getClinicName() { return clinicName; }
    public void setClinicName(String clinicName) { this.clinicName = clinicName; }

    public String getClinicAddress() { return clinicAddress; }
    public void setClinicAddress(String clinicAddress) { this.clinicAddress = clinicAddress; }

    public List<Vaccine> getVaccines() { return vaccines;}
    public void setVaccines(List<Vaccine> vaccines) { this.vaccines = vaccines; }

}