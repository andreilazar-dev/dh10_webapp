package com.dh10.dh10_web.model;

import java.util.List;

public class WrapperManualInsert {
    List<Manulinsert> manulinsert;

    public WrapperManualInsert() {
    }

    public WrapperManualInsert(List<Manulinsert> manulinsert) {
        this.manulinsert = manulinsert;
    }

    public List<Manulinsert> getManulinsert() {
        return manulinsert;
    }

    public void setManulinsert(List<Manulinsert> manulinsert) {
        this.manulinsert = manulinsert;
    }
}
