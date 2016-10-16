/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dto;

/**
 *
 * @author FARID SANTIAGO
 */
public class InformacionDTO {
    
    private String mision, vision, historia;

    public InformacionDTO(String mision, String vision, String historia) {
        this.mision = mision;
        this.vision = vision;
        this.historia = historia;
    }

    public InformacionDTO() {
    }

    public String getMision() {
        return mision;
    }

    public void setMision(String mision) {
        this.mision = mision;
    }

    public String getVision() {
        return vision;
    }

    public void setVision(String vision) {
        this.vision = vision;
    }

    public String getHistoria() {
        return historia;
    }

    public void setHistoria(String historia) {
        this.historia = historia;
    }
    
    
}
