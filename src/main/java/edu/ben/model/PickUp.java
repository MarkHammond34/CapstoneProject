package edu.ben.model;

import javax.persistence.*;
import java.sql.Time;
import java.sql.Timestamp;

@Table(name = "pick_up")
@Entity(name = "pick_up")
public class PickUp {

    @Id
    @Column(name = "pick_up_id")
    private int pickUpID;

    @OneToOne
    @JoinColumn(name = "transaction_id")
    private Transaction transaction;

    @OneToOne
    @JoinColumn(name = "location_id")
    private Location location;

    @Column(name = "pick_up_timestamp")
    private Timestamp pickUpTimestamp;

    @Column(name = "date_created")
    private Timestamp dateCreated;

    @Column(name = "active")
    private int active;

    public PickUp() {
    }

    public int getPickUpID() {
        return pickUpID;
    }

    public void setPickUpID(int pickUpID) {
        this.pickUpID = pickUpID;
    }

    public Transaction getTransaction() {
        return transaction;
    }

    public void setTransaction(Transaction transaction) {
        this.transaction = transaction;
    }

    public Location getLocation() {
        return location;
    }

    public void setLocation(Location location) {
        this.location = location;
    }

    public Timestamp getPickUpTimestamp() {
        return pickUpTimestamp;
    }

    public void setPickUpTimestamp(Timestamp pickUpTimestamp) {
        this.pickUpTimestamp = pickUpTimestamp;
    }

    public Timestamp getDateCreated() {
        return dateCreated;
    }

    public void setDateCreated(Timestamp dateCreated) {
        this.dateCreated = dateCreated;
    }
}
