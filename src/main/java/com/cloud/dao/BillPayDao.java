package com.cloud.dao;

import com.cloud.entity.BillPay;
import com.cloud.exception.DaoException;

public interface BillPayDao {
	
	public void payBill(BillPay billPay) throws DaoException;	

}
