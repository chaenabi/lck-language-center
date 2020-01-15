package common;

public class Paging {
	int page = 1; // ?꾩옱 ?섏씠吏 (get)
	private int totalCount; // row ?꾩껜????(get)
	private int beginPage; // 異쒕젰 ?쒖옉
	private int endPage; // 異쒕젰 ??
	private int displayRow = 10; // ???섏씠吏??紐?媛쒖쓽 ??(?좏깮 set)
	private int displayPage = 30; // ???섏씠吏??紐?媛쒖쓽 ?섏씠吏 (?좏깮 set)
    private int startNum;//(page-1)*displayRow+1
	private int endNum;//page*displayRow;
	boolean prev; // prev 踰꾪듉??蹂댁씪嫄댁? ?덈낫?쇨굔吏
	boolean next; // next 踰꾪듉??蹂댁씪嫄댁? ?덈낫?쇨굔吏
	
	public int getStartNum() {
		return startNum;
	}

	public int getEndNum() {
		return endNum;
	}

	public int getPage() {
		return page;
	}

	public void setPage(int page) {
		this.page = page;
	}

	public int getTotalCount() {
		return totalCount;
	}

	public void setTotalCount(int totalCount) {
		// setTotalCount()瑜?瑗??몄텧?댁빞 paging???섍린 ?뚮Ц??
		// paging()?⑥닔瑜?setTotalCount()瑜??몄텧?덉쓣 ???먮룞?쇰줈 ?몄텧?섍쾶 ?쒕떎.
		this.totalCount = totalCount;
		paging();
	}

	public int getDisplayRow() {
		return displayRow;
	}

	public void setDisplayRow(int displayRow) {
		this.displayRow = displayRow;
	}

	public int getDisplayPage() {
		return displayPage;
	}

	public void setDisplayPage(int displayPage) {
		this.displayPage = displayPage;
	}

	public int getBeginPage() {
		return beginPage;
	}

	public int getEndPage() {
		return endPage;
	}

	public boolean isPrev() {
		return prev;
	}

	public boolean isNext() {
		return next;
	}

	private void paging() {
		// prev, next, beginPage, endPage瑜?怨꾩궛?댁꽌 留뚮뱺??
		// 2+9 = 11, 11/10 = 1, 1*10 = 10
		// 10+9 = 19, 19/10 = 1, 1*10 = 10
		// 11+9 = 20, 20/10 = 2, 2*10 = 20
		// 20+9 = 29, 29/10 = 2, 2*10 = 20
		// 111+9 = 120 120/10 = 12, 12*10 = 120

		// (2+9)/10 * 10 (1踰?諛⑸쾿)
		// endPage = ((page+(displayPage-1))/displayPage)*displayPage;

		// 1/10 0.1(?щ┝) 1 (2踰?諛⑸쾿)
		endPage = ((int) Math.ceil(page / (double) displayPage)) * displayPage;
		//System.out.println("endPage : " + endPage);

		beginPage = endPage - (displayPage - 1);
		//System.out.println("beginPage : " + beginPage);

		// 湲 32媛?
		// 32/10 = 3.2 (?щ┝) 4?섏씠吏
		// 2=? 2/10
		int totalPage = (int) Math.ceil(totalCount / (double) displayRow);
		
		if (totalPage < endPage) {
			endPage = totalPage;
			next = false;
		} else {
			next = true;
		}
		prev = (beginPage == 1) ? false : true;// page媛 11?댁긽?먮쭔 ?섏삩??
		//System.out.println("endPage : " + endPage);
		//System.out.println("totalPage : " + totalPage);
		startNum = (page-1)*displayRow+1;
		endNum = page*displayRow;
	}

}