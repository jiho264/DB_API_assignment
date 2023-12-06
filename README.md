# 2023-2 DataBase Project

- Dept. of Embedded Systems Engineering, Information Technology
- Incheon National University, Incheon, Korea
- jiho264@inu.ac.kr
- jiho264@naver.com

## Project Description
- 국내 주식 투자자들을 위해 API에 기반한 투자 정보 제공 서비스.
- 회원정보를 바탕으로 자신의 주식 잔고를 비롯한 전체 자산을 Circle Graph로 시각화하여 제공.
- 관심 카테고리가 같은 타인의 포트폴리오를 Circle Graph로 시각화하여 제공하며, 타인은 매수하였는데 자신은 매수하지 않은 주식 목록 제공.
- 국민연금공단의 국내주식 포트폴리오를 Circle Graph로 시각화하여 제공하며, 매수량이 많은 주식 상위 n개와 자신의 포트폴리오를 비교하여 국민연금공단은 자신보다 무엇을 더 매수하였는지 확인 가능.
- USD, JPY, EUR 환율 정보도 제공.

## Usage
### Pre-requisites
- db/StockManageAPP.sqlite 파일은 db/doc/~.xlsx 파일에 있는 데이터를 기반으로 코드 실행시 생성됨. 해당 파일 삭제하고 StockManageAPP.ipynb 실행시 다시 생성 가능함.
- 정상적인 구동을 위해선, 과제 제출 시 첨부된 myAPI_key.py 파일을 DB_API_assignment 폴더에 넣어야함. 개인정보인 API를 공개하지 않기 위함임.
<pre>
../DB_API_assignment/myAPI_key.py
</pre>
### How to run
- StockManageAPP.ipynb 파일을 실행시키면 됨.
<pre>
../DB_API_assignment/StockManageAPP.ipynb
</pre>
## Contributor
- 201901744 김태수
- 201910763 이지호
