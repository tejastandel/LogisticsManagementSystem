package lms.model;

import java.math.BigDecimal;
import java.util.Date;
import java.util.List;

public class LmsCenterproductExport {
    private BigDecimal id;

    private BigDecimal exportNo;

    private Date datetime;

    private Long lmsSupplierId;

    private List<LmsSupplier> lmsSuppliers;

    public BigDecimal getId() {
        return id;
    }

    public void setId(BigDecimal id) {
        this.id = id;
    }

    public BigDecimal getExportNo() {
        return exportNo;
    }

    public void setExportNo(BigDecimal exportNo) {
        this.exportNo = exportNo;
    }

    public Date getDatetime() {
        return datetime;
    }

    public void setDatetime(Date datetime) {
        this.datetime = datetime;
    }

    public Long getLmsSupplierId() {
        return lmsSupplierId;
    }

    public void setLmsSupplierId(Long lmsSupplierId) {
        this.lmsSupplierId = lmsSupplierId;
    }

    public List<LmsSupplier> getLmsSuppliers() {
        return lmsSuppliers;
    }

    public void setLmsSuppliers(List<LmsSupplier> lmsSuppliers) {
        this.lmsSuppliers = lmsSuppliers;
    }

    @Override
    public String toString() {
        final StringBuilder sb = new StringBuilder("{");
        sb.append("\"id\":")
                .append(id);
        sb.append(",\"exportNo\":")
                .append(exportNo);
        sb.append(",\"datetime\":\"")
                .append(datetime).append('\"');
        sb.append(",\"lmsSupplierId\":")
                .append(lmsSupplierId);
        sb.append(",\"lmsSuppliers\":")
                .append(lmsSuppliers);
        sb.append('}');
        return sb.toString();
    }
}