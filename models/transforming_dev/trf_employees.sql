{{ config(materialized = 'table', schema = 'transforming_dev') }}
 
with recursive managers
       (indent, empid, office, firstname, managername, title, hiredate, extension, yearsalary)
    as
       (
         select '' as indent, empid, office, firstname, firstname as managername, title , hiredate, extension, yearsalary
          from {{ref('stg_employees')}}
          where title = 'President'
        union all
         select indent || '* ',
            e.empid, e.office, e.firstname, m.firstname as managername, e.title, e.hiredate, e.extension, e.yearsalary
          from {{ref('stg_employees')}} as e join managers as m
            on e.reportsto = m.empid
      )
      ,
       offices (officeid, officecity, officestate, officecountry)
      as
      (
        select office, officecity, OFFICESTATEPROVINCE, officecountry
        from
        {{ref('stg_offices')}}
      )
         select indent || title as title, empid, firstname, managername, hiredate, extension, yearsalary,
  o.officecity, o.officestate, o.officecountry
    from managers as m inner join offices as o on o.officeid = m.office