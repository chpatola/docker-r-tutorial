FROM rocker/r-ver:4.1.2

#Install aptitude for package installations
RUN apt update -y && apt-get install apt-utils -y && apt install aptitude -y

#Install ubuntu packages
RUN aptitude install libssl-dev -y &&\
    aptitude install libxml2-dev -y

# install renv package
RUN Rscript -e "install.packages('renv')"

WORKDIR /usr/src/orders

# Copy . . 

# Restore all the packages
RUN Rscript -e "renv::restore()"

CMD ["Rscript", "handle_data.r"]



