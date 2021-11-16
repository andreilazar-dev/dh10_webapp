package com.dh10.dh10_web.model;

import java.util.ArrayList;
import java.util.List;

public class Approved {

    List<String> approvedList = new ArrayList<>();

    public Approved() {
    }

    public Approved(List<String> approvedList) {
        this.approvedList = approvedList;
    }

    public List<String> getApprovedList() {
        return approvedList;
    }

    public void setApprovedList(List<String> approvedList) {
        this.approvedList = approvedList;
    }
}
