package Modelo;

import java.util.Date;

public class Vaccine {
    private String name;
    private Date date;
    private String batch;
    private String vetName;
    private String vetLicense;
    private String clinicName;
    private String clinicAddress;

    public Vaccine() {
    }

    public Vaccine(String name, Date date, String batch, String vetName, String vetLicense, String clinicName, String clinicAddress) {
        this.name = name;
        this.date = date;
        this.batch = batch;
        this.vetName = vetName;
        this.vetLicense = vetLicense;
        this.clinicName = clinicName;
        this.clinicAddress = clinicAddress;
    }
    
    // Getters y setters para todos los campos
    public String getName() { return name; }
    public void setName(String name) { this.name = name; }
    
    public Date getDate() { return date; }
    public void setDate(Date date) { this.date = date; }
    
    public String getBatch() { return batch; }
    public void setBatch(String batch) { this.batch = batch; }
    
    public String getVetName() { return vetName; }
    public void setVetName(String vetName) { this.vetName = vetName; }
    
    public String getVetLicense() { return vetLicense; }
    public void setVetLicense(String vetLicense) { this.vetLicense = vetLicense; }
    
    public String getClinicName() { return clinicName; }
    public void setClinicName(String clinicName) { this.clinicName = clinicName; }
    
    public String getClinicAddress() { return clinicAddress; }
    public void setClinicAddress(String clinicAddress) { this.clinicAddress = clinicAddress; }
}