FROM python
RUN pip install internetarchive
RUN curl -GOL https://raw.githubusercontent.com/Famicoman/ia-collection-dl/master/ia-collection-dl.py
ENTRYPOINT ["python", "ia-collection-dl.py"]

