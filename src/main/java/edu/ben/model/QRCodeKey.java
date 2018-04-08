package edu.ben.model;

import org.springframework.transaction.annotation.Transactional;

import javax.persistence.*;
import java.sql.Timestamp;

@Transactional
@Table(name = "qr_code_key")
@Entity(name = "qr_code_key")
public class QRCodeKey {

    @Id
    @Column(name = "key")
    private String key;

    @OneToOne
    @JoinColumn(name = "pick_up_id")
    private PickUp pickUp;

    @Column(name = "date_created")
    private Timestamp dateCreated;

    @Column(name = "status")
    private String status;

    public QRCodeKey() {
    }

    public QRCodeKey(String key, PickUp pickUp) {
        this.key = key;
        this.pickUp = pickUp;
        this.status = "CREATED";
    }

    public String getKey() {
        return key;
    }

    public void setKey(String key) {
        this.key = key;
    }

    public PickUp getPickUp() {
        return pickUp;
    }

    public void setPickUp(PickUp pickUp) {
        this.pickUp = pickUp;
    }

    public Timestamp getDateCreated() {
        return dateCreated;
    }

    public void setDateCreated(Timestamp dateCreated) {
        this.dateCreated = dateCreated;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }
}
