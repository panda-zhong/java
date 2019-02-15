package service;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.sql.SQLException;
import java.util.Map;

import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFCellStyle;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.CellStyle;
import org.apache.poi.ss.usermodel.CellType;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.ss.usermodel.WorkbookFactory;

import dao.CommentDao;
import dao.NewsDao;
import dao.impl.CommentDaoImpl;
import dao.impl.NewsDaoImpl;
import util.JacobExcelTool;
import util.JacobWordManager;

public class StatisticService {
	private CommentDao commentDao = new CommentDaoImpl();
	private NewsDao newsDao = new NewsDaoImpl();

	public Map<String, String> getCommentMonthSizeByYear(String year) throws SQLException {
		return this.commentDao.getCommentMonthSizeByYear(year);
	}

	public Map<String, String> getNewsMonthSizeByYear(String year) throws SQLException {
		return this.newsDao.getNewsMonthSizeByYear(year);
	}


	public void testEditFile() throws Exception {
		InputStream io;
		try {
			io = new FileInputStream(new File("D:\\abc.xls"));
			HSSFWorkbook workbook = new HSSFWorkbook(io);
			HSSFSheet sheet = workbook.getSheetAt(0);
			HSSFRow row = sheet.getRow(2);
			HSSFCell cell = row.getCell(0);
			cell.setCellValue("联系人姓gagaga 名：123123子");
			String outputPath = "D:\\abc.xls";
			FileOutputStream fo = new FileOutputStream(new File(outputPath));
			workbook.write(fo);
			workbook.close();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	public void prepareStisticCommentFile() throws SQLException, IOException{
		Map<String, String> map = this.getCommentMonthSizeByYear("2018");
		String fileName = "D:\\panda\\data\\TomcatText\\download\\commonStatistics.xls";
		FileInputStream fileInputStream = new FileInputStream(new File(fileName));
		HSSFWorkbook wb = new HSSFWorkbook(fileInputStream);
		HSSFSheet sheet = wb.getSheetAt(0);
		for (int month = 1; month <= 12; month++) {
			String monthValue;
			if (month < 10) {
				monthValue = map.get("month0" + month);
			} else {
				monthValue = map.get("month" + month);
			}
			HSSFRow row = sheet.getRow(month - 1);
			HSSFCell cell = row.getCell(0);
			if (monthValue != null) {
				System.out.println(month + " " + monthValue);
				cell.setCellValue(Integer.parseInt(monthValue));
			} else {
				cell.setCellValue(0);
			}

		}
		File commonStatisticsExcel = new File(fileName);
		FileOutputStream fileOutputStream = new FileOutputStream(commonStatisticsExcel);
		wb.write(fileOutputStream);
		wb.close();
		String macroName = "commonStatistics";
		JacobExcelTool excelTool = new JacobExcelTool();
		excelTool.OpenExcel(fileName, true, false);
		excelTool.callMacro(macroName);
		excelTool.CloseExcel(true, true);
		JacobWordManager jacobWordManager = new JacobWordManager(false);
		String word = "D:\\panda\\data\\TomcatText\\download\\commonStatistics.docx";
		jacobWordManager.openDocument(word);
		jacobWordManager.callMacro(macroName);
		jacobWordManager.closeDocumentWithSave();
		jacobWordManager.close();
	}
	// public void
}
