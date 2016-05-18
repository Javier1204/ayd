/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dto;

/**
 *
 * @author Javier
 */
public class ComentarioDTO {
    
    private String nick;
    private String comentario;

    public ComentarioDTO(String nick, String comentario) {
        this.nick = nick;
        this.comentario = comentario;
    }
   
    public String getNick() {
        return nick;
    }

    public void setNick(String nick) {
        this.nick = nick;
    }

    public String getComentario() {
        return comentario;
    }

    public void setComentario(String comentario) {
        this.comentario = comentario;
    }
    
    
}
