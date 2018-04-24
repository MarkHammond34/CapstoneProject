package edu.ben.model;

import javax.persistence.*;
import javax.transaction.Transactional;
import java.sql.Timestamp;

@Entity(name = "sales_traffic")
@Table(name = "sales_traffic")
@Transactional
public class SalesTraffic {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "sales_traffic_ID")
    private int salesTrafficID;

    @Column(name = "page_visited")
    String pageVisited;

    @Column(name = "date_created")
    Timestamp dateCreated;

    public SalesTraffic() {

    }

    public SalesTraffic(String pageVisited) {
        this.pageVisited = pageVisited;
    }

    public int getSalesTrafficID() {
        return salesTrafficID;
    }

    public void setSalesTrafficID(int salesTrafficID) {
        this.salesTrafficID = salesTrafficID;
    }

    public String getPageVisited() {
        return pageVisited;
    }


    public Timestamp getDateCreated() {
        return dateCreated;
    }

    public void setDateCreated(Timestamp dateCreated) {
        this.dateCreated = dateCreated;
    }
}
